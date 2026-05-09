; DESCRIPTION: Renders a red disk with center (230, 149) and radius 26.
; PLAN: r0=230(x), r1=149(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 149
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
