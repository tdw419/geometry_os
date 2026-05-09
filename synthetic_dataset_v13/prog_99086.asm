; DESCRIPTION: Places a cyan circle of radius 58 at center (432, 108).
; PLAN: r0=432(x), r1=108(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 108
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
