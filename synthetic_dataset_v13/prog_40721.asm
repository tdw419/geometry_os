; DESCRIPTION: Composite: Renders a yellow box of size 15x30 starting at (294, 196) then Places a cyan line segment connecting (240, 0) to (115, 223).
; PLAN: r0=294(x), r1=196(y), r2=15(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=0(y1), r7=115(x2), r8=223(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 196
LDI r2, 15
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 0
LDI r7, 115
LDI r8, 223
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
