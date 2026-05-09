; DESCRIPTION: Renders a green box of size 114x15 starting at (13, 176).
; PLAN: r0=13(x), r1=176(y), r2=114(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 176
LDI r2, 114
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
