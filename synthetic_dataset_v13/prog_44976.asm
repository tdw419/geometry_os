; DESCRIPTION: Places a yellow circle of radius 44 at center (46, 205).
; PLAN: r0=46(x), r1=205(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 205
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
