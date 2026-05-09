; DESCRIPTION: Draws a black circle centered at (428, 70) with radius 33.
; PLAN: r0=428(x), r1=70(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 70
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
