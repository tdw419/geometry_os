; DESCRIPTION: Draws a blue circle centered at (243, 152) with radius 74.
; PLAN: r0=243(x), r1=152(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 152
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
