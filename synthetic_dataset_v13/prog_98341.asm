; DESCRIPTION: Renders a yellow disk with center (428, 132) and radius 19.
; PLAN: r0=428(x), r1=132(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 132
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
