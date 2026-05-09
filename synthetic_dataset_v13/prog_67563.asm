; DESCRIPTION: Places a black circle of radius 50 at center (249, 205).
; PLAN: r0=249(x), r1=205(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 205
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
