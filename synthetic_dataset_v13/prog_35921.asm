; DESCRIPTION: Renders a magenta box of size 106x37 starting at (98, 43).
; PLAN: r0=98(x), r1=43(y), r2=106(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 43
LDI r2, 106
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
