; DESCRIPTION: Creates a magenta rectangular region at (276, 200) spanning 115 by 35 pixels.
; PLAN: r0=276(x), r1=200(y), r2=115(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 200
LDI r2, 115
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
