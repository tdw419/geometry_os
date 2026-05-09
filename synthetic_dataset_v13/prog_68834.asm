; DESCRIPTION: Draws a red circle centered at (193, 199) with radius 11.
; PLAN: r0=193(x), r1=199(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 199
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
