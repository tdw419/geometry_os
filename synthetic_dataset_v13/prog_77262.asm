; DESCRIPTION: Renders a magenta box of size 88x120 starting at (279, 97).
; PLAN: r0=279(x), r1=97(y), r2=88(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 97
LDI r2, 88
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
