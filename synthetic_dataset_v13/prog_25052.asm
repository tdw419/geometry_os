; DESCRIPTION: Renders a magenta box of size 112x37 starting at (177, 56).
; PLAN: r0=177(x), r1=56(y), r2=112(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 56
LDI r2, 112
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
