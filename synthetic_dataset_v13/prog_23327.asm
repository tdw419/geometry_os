; DESCRIPTION: Renders a blue box of size 60x13 starting at (126, 116).
; PLAN: r0=126(x), r1=116(y), r2=60(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 116
LDI r2, 60
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
