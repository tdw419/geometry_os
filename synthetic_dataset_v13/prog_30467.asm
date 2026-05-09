; DESCRIPTION: Renders a red disk with center (222, 46) and radius 19.
; PLAN: r0=222(x), r1=46(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 46
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
