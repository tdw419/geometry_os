; DESCRIPTION: Renders a blue box of size 116x107 starting at (353, 12).
; PLAN: r0=353(x), r1=12(y), r2=116(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 12
LDI r2, 116
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
