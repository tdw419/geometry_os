; DESCRIPTION: Draws a yellow circle centered at (425, 93) with radius 75.
; PLAN: r0=425(x), r1=93(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 93
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
