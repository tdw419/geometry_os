; DESCRIPTION: Draws a orange circle centered at (398, 78) with radius 54.
; PLAN: r0=398(x), r1=78(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 78
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
