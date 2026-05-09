; DESCRIPTION: Draws a black circle centered at (210, 187) with radius 46.
; PLAN: r0=210(x), r1=187(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 187
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
