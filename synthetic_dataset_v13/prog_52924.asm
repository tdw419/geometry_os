; DESCRIPTION: Draws a red circle centered at (66, 115) with radius 50.
; PLAN: r0=66(x), r1=115(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 115
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
