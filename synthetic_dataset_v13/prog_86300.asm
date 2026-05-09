; DESCRIPTION: Renders a blue box of size 20x62 starting at (42, 84).
; PLAN: r0=42(x), r1=84(y), r2=20(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 84
LDI r2, 20
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
