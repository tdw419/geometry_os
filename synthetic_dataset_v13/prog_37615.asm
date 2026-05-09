; DESCRIPTION: Renders a magenta box of size 74x34 starting at (26, 128).
; PLAN: r0=26(x), r1=128(y), r2=74(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 128
LDI r2, 74
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
