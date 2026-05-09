; DESCRIPTION: Renders a red disk with center (258, 229) and radius 21.
; PLAN: r0=258(x), r1=229(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 229
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
