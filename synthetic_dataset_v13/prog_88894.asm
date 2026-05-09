; DESCRIPTION: Renders a red disk with center (366, 177) and radius 24.
; PLAN: r0=366(x), r1=177(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 177
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
