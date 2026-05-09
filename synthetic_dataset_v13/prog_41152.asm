; DESCRIPTION: Renders a cyan disk with center (98, 216) and radius 40.
; PLAN: r0=98(x), r1=216(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 216
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
