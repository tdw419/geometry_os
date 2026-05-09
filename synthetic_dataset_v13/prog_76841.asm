; DESCRIPTION: Renders a red disk with center (162, 69) and radius 68.
; PLAN: r0=162(x), r1=69(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 69
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
