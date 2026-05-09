; DESCRIPTION: Renders a cyan disk with center (220, 117) and radius 31.
; PLAN: r0=220(x), r1=117(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 117
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
