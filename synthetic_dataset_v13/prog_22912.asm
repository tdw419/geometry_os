; DESCRIPTION: Draws a black circle centered at (387, 152) with radius 21.
; PLAN: r0=387(x), r1=152(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 152
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
