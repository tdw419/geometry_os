; DESCRIPTION: Renders a cyan disk with center (427, 108) and radius 46.
; PLAN: r0=427(x), r1=108(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 108
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
