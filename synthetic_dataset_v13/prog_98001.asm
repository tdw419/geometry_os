; DESCRIPTION: Places a cyan circle of radius 58 at center (195, 112).
; PLAN: r0=195(x), r1=112(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 112
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
