; DESCRIPTION: Draws a red circle centered at (282, 133) with radius 54.
; PLAN: r0=282(x), r1=133(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 133
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
