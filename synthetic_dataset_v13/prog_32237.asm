; DESCRIPTION: Renders a magenta box of size 107x43 starting at (194, 8).
; PLAN: r0=194(x), r1=8(y), r2=107(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 8
LDI r2, 107
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
