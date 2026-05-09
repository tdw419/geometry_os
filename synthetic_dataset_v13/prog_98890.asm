; DESCRIPTION: Creates a blue circular shape at (69, 108) with radius 46.
; PLAN: r0=69(x), r1=108(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 108
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
