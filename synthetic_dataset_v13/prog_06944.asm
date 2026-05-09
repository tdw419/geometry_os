; DESCRIPTION: Renders a cyan disk with center (115, 161) and radius 37.
; PLAN: r0=115(x), r1=161(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 161
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
