; DESCRIPTION: Renders a magenta box of size 116x94 starting at (190, 74).
; PLAN: r0=190(x), r1=74(y), r2=116(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 74
LDI r2, 116
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
