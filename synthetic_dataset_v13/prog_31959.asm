; DESCRIPTION: Creates a yellow circular shape at (392, 65) with radius 62.
; PLAN: r0=392(x), r1=65(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 65
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
