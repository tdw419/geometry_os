; DESCRIPTION: Renders a red disk with center (366, 167) and radius 45.
; PLAN: r0=366(x), r1=167(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 167
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
