; DESCRIPTION: Renders a white disk with center (69, 97) and radius 68.
; PLAN: r0=69(x), r1=97(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 97
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
