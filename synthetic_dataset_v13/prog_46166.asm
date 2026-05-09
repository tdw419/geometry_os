; DESCRIPTION: Renders a black box of size 118x82 starting at (203, 12).
; PLAN: r0=203(x), r1=12(y), r2=118(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 118
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
