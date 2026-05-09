; DESCRIPTION: Renders a cyan disk with center (88, 138) and radius 36.
; PLAN: r0=88(x), r1=138(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 138
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
