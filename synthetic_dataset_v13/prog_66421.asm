; DESCRIPTION: Draws a red circle centered at (236, 137) with radius 26.
; PLAN: r0=236(x), r1=137(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 137
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
