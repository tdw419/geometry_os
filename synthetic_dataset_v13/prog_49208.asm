; DESCRIPTION: Renders a red disk with center (40, 214) and radius 35.
; PLAN: r0=40(x), r1=214(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 214
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
