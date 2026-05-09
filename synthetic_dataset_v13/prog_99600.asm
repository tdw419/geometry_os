; DESCRIPTION: Draws a red circle centered at (413, 192) with radius 23.
; PLAN: r0=413(x), r1=192(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 192
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
