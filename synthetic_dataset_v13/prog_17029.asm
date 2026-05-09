; DESCRIPTION: Draws a black circle centered at (303, 122) with radius 68.
; PLAN: r0=303(x), r1=122(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 122
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
