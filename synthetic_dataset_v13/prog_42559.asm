; DESCRIPTION: Renders a magenta box of size 118x116 starting at (361, 74).
; PLAN: r0=361(x), r1=74(y), r2=118(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 74
LDI r2, 118
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
