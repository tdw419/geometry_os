; DESCRIPTION: Renders a yellow disk with center (301, 202) and radius 46.
; PLAN: r0=301(x), r1=202(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 202
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
