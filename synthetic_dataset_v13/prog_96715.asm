; DESCRIPTION: Renders a blue box of size 71x36 starting at (126, 170).
; PLAN: r0=126(x), r1=170(y), r2=71(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 170
LDI r2, 71
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
