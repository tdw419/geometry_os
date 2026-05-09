; DESCRIPTION: Draws a black circle centered at (392, 161) with radius 76.
; PLAN: r0=392(x), r1=161(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 161
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
