; DESCRIPTION: Creates a magenta rectangular region at (105, 36) spanning 94 by 112 pixels.
; PLAN: r0=105(x), r1=36(y), r2=94(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 36
LDI r2, 94
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
