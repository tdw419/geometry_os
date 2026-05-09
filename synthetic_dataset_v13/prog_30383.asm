; DESCRIPTION: Creates a yellow circular shape at (231, 113) with radius 29.
; PLAN: r0=231(x), r1=113(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 113
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
