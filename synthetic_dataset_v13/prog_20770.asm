; DESCRIPTION: Creates a red circular shape at (451, 71) with radius 46.
; PLAN: r0=451(x), r1=71(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 71
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
