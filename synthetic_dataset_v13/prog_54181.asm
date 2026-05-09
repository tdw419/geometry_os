; DESCRIPTION: Composite: Places a black line segment connecting (39, 105) to (480, 247) then Creates a green circular shape at (421, 57) with radius 23.
; PLAN: r0=39(x1), r1=105(y1), r2=480(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=57(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 105
LDI r2, 480
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 57
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
