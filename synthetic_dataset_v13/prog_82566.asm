; DESCRIPTION: Renders a magenta box of size 84x107 starting at (132, 79).
; PLAN: r0=132(x), r1=79(y), r2=84(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 79
LDI r2, 84
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
