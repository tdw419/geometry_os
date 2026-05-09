; DESCRIPTION: Draws a orange circle centered at (279, 180) with radius 28.
; PLAN: r0=279(x), r1=180(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 180
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
