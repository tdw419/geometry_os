; DESCRIPTION: Renders a magenta box of size 74x64 starting at (359, 122).
; PLAN: r0=359(x), r1=122(y), r2=74(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 122
LDI r2, 74
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
