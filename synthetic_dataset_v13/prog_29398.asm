; DESCRIPTION: Renders a cyan disk with center (321, 22) and radius 14.
; PLAN: r0=321(x), r1=22(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 22
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
