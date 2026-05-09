; DESCRIPTION: Draws a yellow circle centered at (346, 70) with radius 67.
; PLAN: r0=346(x), r1=70(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 70
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
