; DESCRIPTION: Creates a magenta rectangular region at (427, 104) spanning 37 by 108 pixels.
; PLAN: r0=427(x), r1=104(y), r2=37(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 104
LDI r2, 37
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
