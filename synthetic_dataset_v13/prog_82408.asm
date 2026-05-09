; DESCRIPTION: Creates a green circular shape at (446, 149) with radius 13.
; PLAN: r0=446(x), r1=149(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 149
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
