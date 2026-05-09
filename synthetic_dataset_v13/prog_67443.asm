; DESCRIPTION: Draws a red circle centered at (115, 194) with radius 56.
; PLAN: r0=115(x), r1=194(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 194
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
