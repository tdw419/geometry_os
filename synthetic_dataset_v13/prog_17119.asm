; DESCRIPTION: Draws a red circle centered at (263, 138) with radius 52.
; PLAN: r0=263(x), r1=138(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 138
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
