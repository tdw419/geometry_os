; DESCRIPTION: Renders a cyan disk with center (311, 161) and radius 44.
; PLAN: r0=311(x), r1=161(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 161
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
