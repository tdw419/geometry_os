; DESCRIPTION: Renders a red disk with center (72, 180) and radius 19.
; PLAN: r0=72(x), r1=180(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 180
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
