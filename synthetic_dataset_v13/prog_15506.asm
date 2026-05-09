; DESCRIPTION: Renders a magenta box of size 108x48 starting at (194, 158).
; PLAN: r0=194(x), r1=158(y), r2=108(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 158
LDI r2, 108
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
