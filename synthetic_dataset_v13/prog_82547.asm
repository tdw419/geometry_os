; DESCRIPTION: Draws a red circle centered at (382, 144) with radius 68.
; PLAN: r0=382(x), r1=144(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 144
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
