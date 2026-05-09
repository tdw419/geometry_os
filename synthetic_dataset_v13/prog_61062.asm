; DESCRIPTION: Composite: Places a red line segment connecting (214, 28) to (410, 226) then Places a green circle of radius 64 at center (226, 154).
; PLAN: r0=214(x1), r1=28(y1), r2=410(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=154(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 28
LDI r2, 410
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 154
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
