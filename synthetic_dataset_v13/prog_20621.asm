; DESCRIPTION: Renders a red disk with center (286, 161) and radius 65.
; PLAN: r0=286(x), r1=161(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 161
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
