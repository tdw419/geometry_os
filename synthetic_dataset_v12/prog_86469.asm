; DESCRIPTION: Renders a cyan disk with center (444, 141) and radius 23.
; PLAN: r0=444(x), r1=141(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 141
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
