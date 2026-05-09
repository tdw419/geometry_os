; DESCRIPTION: Renders a red disk with center (337, 160) and radius 36.
; PLAN: r0=337(x), r1=160(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 160
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
