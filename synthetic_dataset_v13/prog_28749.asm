; DESCRIPTION: Renders a blue box of size 97x74 starting at (126, 40).
; PLAN: r0=126(x), r1=40(y), r2=97(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 40
LDI r2, 97
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
