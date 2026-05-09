; DESCRIPTION: Renders a green box of size 74x31 starting at (122, 150).
; PLAN: r0=122(x), r1=150(y), r2=74(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 150
LDI r2, 74
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
