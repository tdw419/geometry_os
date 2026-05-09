; DESCRIPTION: Draws a yellow circle centered at (91, 117) with radius 43.
; PLAN: r0=91(x), r1=117(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 117
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
