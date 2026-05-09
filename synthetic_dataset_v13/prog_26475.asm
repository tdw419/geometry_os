; DESCRIPTION: Renders a red disk with center (161, 198) and radius 39.
; PLAN: r0=161(x), r1=198(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 198
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
