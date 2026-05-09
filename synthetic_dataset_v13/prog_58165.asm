; DESCRIPTION: Renders a yellow disk with center (301, 74) and radius 56.
; PLAN: r0=301(x), r1=74(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 74
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
