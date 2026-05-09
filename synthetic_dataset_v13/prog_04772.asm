; DESCRIPTION: Draws a red circle centered at (319, 135) with radius 67.
; PLAN: r0=319(x), r1=135(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 135
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
