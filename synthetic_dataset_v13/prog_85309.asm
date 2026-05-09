; DESCRIPTION: Renders a cyan disk with center (359, 193) and radius 35.
; PLAN: r0=359(x), r1=193(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 193
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
