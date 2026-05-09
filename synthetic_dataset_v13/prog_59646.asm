; DESCRIPTION: Places a cyan circle of radius 75 at center (423, 130).
; PLAN: r0=423(x), r1=130(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 130
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
