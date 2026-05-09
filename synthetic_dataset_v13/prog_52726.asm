; DESCRIPTION: Renders a red disk with center (70, 133) and radius 49.
; PLAN: r0=70(x), r1=133(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 133
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
