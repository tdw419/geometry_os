; DESCRIPTION: Draws a yellow circle centered at (180, 72) with radius 31.
; PLAN: r0=180(x), r1=72(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 72
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
