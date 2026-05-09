; DESCRIPTION: Renders a cyan disk with center (484, 140) and radius 14.
; PLAN: r0=484(x), r1=140(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 140
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
