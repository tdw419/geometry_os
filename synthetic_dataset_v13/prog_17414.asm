; DESCRIPTION: Draws a black circle centered at (229, 231) with radius 21.
; PLAN: r0=229(x), r1=231(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 231
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
