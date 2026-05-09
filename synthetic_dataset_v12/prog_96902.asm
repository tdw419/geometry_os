; DESCRIPTION: Renders a white disk with center (352, 177) and radius 67.
; PLAN: r0=352(x), r1=177(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 177
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
