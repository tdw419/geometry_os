; DESCRIPTION: Draws a yellow circle centered at (364, 132) with radius 61.
; PLAN: r0=364(x), r1=132(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 132
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
