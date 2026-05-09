; DESCRIPTION: Renders a cyan disk with center (140, 193) and radius 58.
; PLAN: r0=140(x), r1=193(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 193
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
