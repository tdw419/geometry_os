; DESCRIPTION: Renders a magenta box of size 81x62 starting at (250, 13).
; PLAN: r0=250(x), r1=13(y), r2=81(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 13
LDI r2, 81
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
