; DESCRIPTION: Places a cyan circle of radius 11 at center (281, 147).
; PLAN: r0=281(x), r1=147(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 147
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
