; DESCRIPTION: Composite: Places a orange line segment connecting (20, 105) to (242, 2) then Creates a white circular shape at (112, 96) with radius 77.
; PLAN: r0=20(x1), r1=105(y1), r2=242(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=96(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 105
LDI r2, 242
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 96
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
