; DESCRIPTION: Renders a black disk with center (303, 231) and radius 13.
; PLAN: r0=303(x), r1=231(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 231
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
