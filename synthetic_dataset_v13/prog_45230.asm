; DESCRIPTION: Renders a magenta box of size 97x78 starting at (84, 16).
; PLAN: r0=84(x), r1=16(y), r2=97(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 16
LDI r2, 97
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
