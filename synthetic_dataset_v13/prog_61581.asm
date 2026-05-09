; DESCRIPTION: Draws a blue circle centered at (392, 82) with radius 64.
; PLAN: r0=392(x), r1=82(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 82
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
