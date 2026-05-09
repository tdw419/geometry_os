; DESCRIPTION: Renders a cyan disk with center (84, 176) and radius 43.
; PLAN: r0=84(x), r1=176(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 176
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
