; DESCRIPTION: Renders a black disk with center (404, 126) and radius 67.
; PLAN: r0=404(x), r1=126(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 126
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
