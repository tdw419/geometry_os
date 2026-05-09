; DESCRIPTION: Renders a red disk with center (395, 69) and radius 65.
; PLAN: r0=395(x), r1=69(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 69
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
