; DESCRIPTION: Renders a purple disk with center (187, 181) and radius 43.
; PLAN: r0=187(x), r1=181(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 181
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
