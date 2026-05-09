; DESCRIPTION: Renders a red disk with center (258, 160) and radius 28.
; PLAN: r0=258(x), r1=160(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 160
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
