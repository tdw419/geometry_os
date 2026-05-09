; DESCRIPTION: Renders a black box of size 83x113 starting at (378, 24).
; PLAN: r0=378(x), r1=24(y), r2=83(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 24
LDI r2, 83
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
