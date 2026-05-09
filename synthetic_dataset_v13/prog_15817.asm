; DESCRIPTION: Draws a purple circle centered at (100, 146) with radius 46.
; PLAN: r0=100(x), r1=146(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 146
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
