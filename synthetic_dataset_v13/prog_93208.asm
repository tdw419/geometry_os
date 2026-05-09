; DESCRIPTION: Draws a blue circle centered at (190, 90) with radius 25.
; PLAN: r0=190(x), r1=90(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 90
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
