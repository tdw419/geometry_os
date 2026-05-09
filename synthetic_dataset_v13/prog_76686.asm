; DESCRIPTION: Draws a green circle centered at (387, 44) with radius 30.
; PLAN: r0=387(x), r1=44(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 44
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
