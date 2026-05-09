; DESCRIPTION: Renders a black box of size 113x25 starting at (378, 90).
; PLAN: r0=378(x), r1=90(y), r2=113(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 90
LDI r2, 113
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
