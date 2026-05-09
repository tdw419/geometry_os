; DESCRIPTION: Composite: Places a red line segment connecting (110, 46) to (161, 128) then Renders a black disk with center (110, 109) and radius 80.
; PLAN: r0=110(x1), r1=46(y1), r2=161(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=109(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 46
LDI r2, 161
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 109
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
