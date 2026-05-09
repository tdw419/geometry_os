; DESCRIPTION: Renders a yellow disk with center (182, 175) and radius 74.
; PLAN: r0=182(x), r1=175(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 175
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
