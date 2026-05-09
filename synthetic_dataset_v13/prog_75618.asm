; DESCRIPTION: Renders a green disk with center (292, 148) and radius 68.
; PLAN: r0=292(x), r1=148(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 148
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
