; DESCRIPTION: Creates a magenta rectangular region at (276, 150) spanning 68 by 96 pixels.
; PLAN: r0=276(x), r1=150(y), r2=68(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 150
LDI r2, 68
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
