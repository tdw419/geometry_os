; DESCRIPTION: Draws a purple circle centered at (288, 146) with radius 65.
; PLAN: r0=288(x), r1=146(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 146
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
