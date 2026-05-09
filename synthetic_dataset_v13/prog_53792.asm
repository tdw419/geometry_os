; DESCRIPTION: Renders a magenta box of size 118x22 starting at (253, 115).
; PLAN: r0=253(x), r1=115(y), r2=118(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 115
LDI r2, 118
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
