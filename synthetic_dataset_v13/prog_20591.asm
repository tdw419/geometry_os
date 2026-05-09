; DESCRIPTION: Draws a green circle centered at (236, 112) with radius 72.
; PLAN: r0=236(x), r1=112(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 112
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
