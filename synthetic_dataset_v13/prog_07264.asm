; DESCRIPTION: Renders a white box of size 28x108 starting at (378, 90).
; PLAN: r0=378(x), r1=90(y), r2=28(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 90
LDI r2, 28
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
