; DESCRIPTION: Draws a purple circle centered at (392, 220) with radius 13.
; PLAN: r0=392(x), r1=220(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 220
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
