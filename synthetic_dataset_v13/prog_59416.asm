; DESCRIPTION: Renders a white box of size 26x82 starting at (362, 118).
; PLAN: r0=362(x), r1=118(y), r2=26(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 118
LDI r2, 26
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
