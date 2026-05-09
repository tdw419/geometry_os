; DESCRIPTION: Draws a red circle centered at (234, 168) with radius 74.
; PLAN: r0=234(x), r1=168(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 168
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
