; DESCRIPTION: Renders a yellow box of size 29x60 starting at (203, 118).
; PLAN: r0=203(x), r1=118(y), r2=29(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 118
LDI r2, 29
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
