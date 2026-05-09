; DESCRIPTION: Renders a red disk with center (428, 148) and radius 46.
; PLAN: r0=428(x), r1=148(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 148
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
