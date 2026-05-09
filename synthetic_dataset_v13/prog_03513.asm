; DESCRIPTION: Creates a black circular shape at (70, 133) with radius 46.
; PLAN: r0=70(x), r1=133(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 133
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
