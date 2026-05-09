; DESCRIPTION: Creates a magenta rectangular region at (248, 136) spanning 97 by 30 pixels.
; PLAN: r0=248(x), r1=136(y), r2=97(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 136
LDI r2, 97
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
