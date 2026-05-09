; DESCRIPTION: Renders a magenta box of size 13x22 starting at (279, 37).
; PLAN: r0=279(x), r1=37(y), r2=13(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 37
LDI r2, 13
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
