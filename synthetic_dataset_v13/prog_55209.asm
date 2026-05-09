; DESCRIPTION: Renders a magenta box of size 90x97 starting at (52, 127).
; PLAN: r0=52(x), r1=127(y), r2=90(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 127
LDI r2, 90
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
