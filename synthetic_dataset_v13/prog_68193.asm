; DESCRIPTION: Draws a red circle centered at (434, 108) with radius 63.
; PLAN: r0=434(x), r1=108(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 108
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
