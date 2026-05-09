; DESCRIPTION: Places a cyan circle of radius 15 at center (453, 72).
; PLAN: r0=453(x), r1=72(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 72
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
