; DESCRIPTION: Draws a white circle centered at (249, 127) with radius 48.
; PLAN: r0=249(x), r1=127(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 127
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
