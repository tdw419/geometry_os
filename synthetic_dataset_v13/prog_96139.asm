; DESCRIPTION: Draws a blue circle centered at (482, 152) with radius 20.
; PLAN: r0=482(x), r1=152(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 152
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
