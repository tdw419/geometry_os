; DESCRIPTION: Renders a magenta box of size 79x26 starting at (52, 132).
; PLAN: r0=52(x), r1=132(y), r2=79(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 132
LDI r2, 79
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
