; DESCRIPTION: Renders a magenta box of size 99x106 starting at (150, 122).
; PLAN: r0=150(x), r1=122(y), r2=99(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 122
LDI r2, 99
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
