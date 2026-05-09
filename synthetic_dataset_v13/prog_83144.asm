; DESCRIPTION: Draws a green circle centered at (387, 206) with radius 28.
; PLAN: r0=387(x), r1=206(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 206
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
