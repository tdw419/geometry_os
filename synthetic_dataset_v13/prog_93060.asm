; DESCRIPTION: Renders a orange disk with center (279, 153) and radius 65.
; PLAN: r0=279(x), r1=153(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 153
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
