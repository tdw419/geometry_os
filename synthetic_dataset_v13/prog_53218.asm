; DESCRIPTION: Renders a magenta box of size 97x66 starting at (296, 23).
; PLAN: r0=296(x), r1=23(y), r2=97(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 23
LDI r2, 97
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
