; DESCRIPTION: Draws a white circle centered at (84, 187) with radius 67.
; PLAN: r0=84(x), r1=187(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 187
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
