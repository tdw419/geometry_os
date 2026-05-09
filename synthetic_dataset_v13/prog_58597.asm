; DESCRIPTION: Renders a magenta box of size 35x97 starting at (358, 13).
; PLAN: r0=358(x), r1=13(y), r2=35(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 13
LDI r2, 35
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
