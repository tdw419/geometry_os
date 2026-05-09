; DESCRIPTION: Draws a green circle centered at (218, 231) with radius 15.
; PLAN: r0=218(x), r1=231(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 231
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
