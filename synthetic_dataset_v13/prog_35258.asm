; DESCRIPTION: Draws a orange circle centered at (386, 57) with radius 35.
; PLAN: r0=386(x), r1=57(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 57
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
