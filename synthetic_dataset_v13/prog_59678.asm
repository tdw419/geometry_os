; DESCRIPTION: Draws a yellow circle centered at (107, 60) with radius 50.
; PLAN: r0=107(x), r1=60(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 60
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
