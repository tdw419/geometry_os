; DESCRIPTION: Renders a red disk with center (229, 108) and radius 73.
; PLAN: r0=229(x), r1=108(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 108
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
