; DESCRIPTION: Renders a yellow disk with center (214, 125) and radius 68.
; PLAN: r0=214(x), r1=125(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 125
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
