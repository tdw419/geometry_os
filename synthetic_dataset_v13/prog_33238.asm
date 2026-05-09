; DESCRIPTION: Draws a purple circle centered at (395, 146) with radius 29.
; PLAN: r0=395(x), r1=146(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 146
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
