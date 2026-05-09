; DESCRIPTION: Draws a red circle centered at (144, 87) with radius 34.
; PLAN: r0=144(x), r1=87(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 87
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
