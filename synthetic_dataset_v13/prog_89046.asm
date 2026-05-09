; DESCRIPTION: Renders a cyan disk with center (67, 235) and radius 14.
; PLAN: r0=67(x), r1=235(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 235
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
