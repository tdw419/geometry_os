; DESCRIPTION: Places a cyan circle of radius 14 at center (136, 75).
; PLAN: r0=136(x), r1=75(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 75
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
