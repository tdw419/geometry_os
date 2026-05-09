; DESCRIPTION: Draws a red circle centered at (128, 201) with radius 52.
; PLAN: r0=128(x), r1=201(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 201
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
