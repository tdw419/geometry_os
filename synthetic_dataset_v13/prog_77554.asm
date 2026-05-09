; DESCRIPTION: Creates a green circular shape at (80, 90) with radius 63.
; PLAN: r0=80(x), r1=90(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 90
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
