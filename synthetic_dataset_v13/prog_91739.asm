; DESCRIPTION: Renders a black box of size 71x30 starting at (170, 203).
; PLAN: r0=170(x), r1=203(y), r2=71(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 203
LDI r2, 71
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
