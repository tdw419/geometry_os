; DESCRIPTION: Renders a cyan disk with center (98, 213) and radius 37.
; PLAN: r0=98(x), r1=213(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 213
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
