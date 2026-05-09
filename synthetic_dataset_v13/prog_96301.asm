; DESCRIPTION: Draws a yellow circle centered at (120, 127) with radius 61.
; PLAN: r0=120(x), r1=127(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 127
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
