; DESCRIPTION: Renders a red disk with center (291, 132) and radius 55.
; PLAN: r0=291(x), r1=132(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 132
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
