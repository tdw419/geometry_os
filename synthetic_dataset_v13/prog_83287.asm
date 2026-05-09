; DESCRIPTION: Renders a cyan disk with center (207, 183) and radius 69.
; PLAN: r0=207(x), r1=183(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 183
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
