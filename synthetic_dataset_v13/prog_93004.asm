; DESCRIPTION: Renders a green box of size 19x52 starting at (126, 43).
; PLAN: r0=126(x), r1=43(y), r2=19(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 43
LDI r2, 19
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
