; DESCRIPTION: Renders a red disk with center (176, 193) and radius 23.
; PLAN: r0=176(x), r1=193(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 193
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
