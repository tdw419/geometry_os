; DESCRIPTION: Places a cyan circle of radius 45 at center (112, 203).
; PLAN: r0=112(x), r1=203(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 203
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
