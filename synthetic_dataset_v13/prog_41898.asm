; DESCRIPTION: Draws a yellow circle centered at (263, 77) with radius 60.
; PLAN: r0=263(x), r1=77(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 77
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
