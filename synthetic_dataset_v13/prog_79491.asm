; DESCRIPTION: Renders a cyan disk with center (431, 86) and radius 49.
; PLAN: r0=431(x), r1=86(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 86
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
