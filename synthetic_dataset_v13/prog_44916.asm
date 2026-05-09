; DESCRIPTION: Renders a magenta box of size 21x116 starting at (194, 140).
; PLAN: r0=194(x), r1=140(y), r2=21(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 140
LDI r2, 21
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
