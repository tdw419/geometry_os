; DESCRIPTION: Renders a red disk with center (121, 168) and radius 79.
; PLAN: r0=121(x), r1=168(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 168
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
