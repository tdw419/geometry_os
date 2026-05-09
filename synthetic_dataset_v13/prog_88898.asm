; DESCRIPTION: Draws a purple circle centered at (277, 214) with radius 21.
; PLAN: r0=277(x), r1=214(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 214
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
