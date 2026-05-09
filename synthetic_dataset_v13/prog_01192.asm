; DESCRIPTION: Renders a blue box of size 83x23 starting at (378, 124).
; PLAN: r0=378(x), r1=124(y), r2=83(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 124
LDI r2, 83
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
