; DESCRIPTION: Renders a magenta box of size 105x58 starting at (396, 132).
; PLAN: r0=396(x), r1=132(y), r2=105(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 132
LDI r2, 105
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
