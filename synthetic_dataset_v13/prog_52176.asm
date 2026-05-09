; DESCRIPTION: Creates a magenta rectangular region at (358, 75) spanning 37 by 102 pixels.
; PLAN: r0=358(x), r1=75(y), r2=37(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 75
LDI r2, 37
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
