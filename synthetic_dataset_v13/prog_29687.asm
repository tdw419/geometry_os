; DESCRIPTION: Creates a magenta circular shape at (406, 65) with radius 43.
; PLAN: r0=406(x), r1=65(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 65
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
