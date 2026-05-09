; DESCRIPTION: Draws a red circle centered at (207, 86) with radius 79.
; PLAN: r0=207(x), r1=86(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 86
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
