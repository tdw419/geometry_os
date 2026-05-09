; DESCRIPTION: Places a red circle of radius 46 at center (192, 87).
; PLAN: r0=192(x), r1=87(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 87
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
