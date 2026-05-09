; DESCRIPTION: Renders a green box of size 18x36 starting at (203, 157).
; PLAN: r0=203(x), r1=157(y), r2=18(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 157
LDI r2, 18
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
