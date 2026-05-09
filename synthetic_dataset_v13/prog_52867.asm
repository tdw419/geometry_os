; DESCRIPTION: Renders a magenta box of size 105x30 starting at (106, 165).
; PLAN: r0=106(x), r1=165(y), r2=105(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 165
LDI r2, 105
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
