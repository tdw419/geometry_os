; DESCRIPTION: Creates a magenta rectangular region at (265, 8) spanning 81 by 118 pixels.
; PLAN: r0=265(x), r1=8(y), r2=81(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 8
LDI r2, 81
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
