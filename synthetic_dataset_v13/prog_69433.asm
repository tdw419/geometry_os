; DESCRIPTION: Composite: Renders a red disk with center (400, 105) and radius 22 then Places a cyan line segment connecting (98, 153) to (128, 150).
; PLAN: r0=400(x), r1=105(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=153(y1), r7=128(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 105
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 153
LDI r7, 128
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
