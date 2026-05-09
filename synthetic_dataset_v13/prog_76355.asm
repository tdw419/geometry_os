; DESCRIPTION: Draws a yellow circle centered at (392, 181) with radius 47.
; PLAN: r0=392(x), r1=181(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 181
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
