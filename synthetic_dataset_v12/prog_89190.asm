; DESCRIPTION: Draws a green circle centered at (308, 81) with radius 70.
; PLAN: r0=308(x), r1=81(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 81
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
