; DESCRIPTION: Composite: Places a orange line segment connecting (504, 242) to (93, 89) then Creates a white circular shape at (237, 115) with radius 70.
; PLAN: r0=504(x1), r1=242(y1), r2=93(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=115(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 242
LDI r2, 93
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 115
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
