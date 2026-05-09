; DESCRIPTION: Renders a blue box of size 53x62 starting at (193, 156).
; PLAN: r0=193(x), r1=156(y), r2=53(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 156
LDI r2, 53
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
