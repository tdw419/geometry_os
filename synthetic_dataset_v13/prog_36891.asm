; DESCRIPTION: Draws a green circle centered at (82, 153) with radius 80.
; PLAN: r0=82(x), r1=153(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 153
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
