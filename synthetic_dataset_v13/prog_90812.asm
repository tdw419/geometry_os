; DESCRIPTION: Renders a cyan disk with center (371, 71) and radius 13.
; PLAN: r0=371(x), r1=71(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 71
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
