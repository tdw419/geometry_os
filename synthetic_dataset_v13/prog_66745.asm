; DESCRIPTION: Renders a yellow disk with center (161, 171) and radius 50.
; PLAN: r0=161(x), r1=171(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 171
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
