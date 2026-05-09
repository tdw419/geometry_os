; DESCRIPTION: Renders a cyan disk with center (381, 65) and radius 47.
; PLAN: r0=381(x), r1=65(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 65
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
