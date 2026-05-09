; DESCRIPTION: Creates a magenta rectangular region at (297, 122) spanning 115 by 70 pixels.
; PLAN: r0=297(x), r1=122(y), r2=115(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 122
LDI r2, 115
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
