; DESCRIPTION: Renders a red disk with center (446, 134) and radius 49.
; PLAN: r0=446(x), r1=134(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 134
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
