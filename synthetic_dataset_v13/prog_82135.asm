; DESCRIPTION: Draws a red circle centered at (160, 128) with radius 78.
; PLAN: r0=160(x), r1=128(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 128
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
