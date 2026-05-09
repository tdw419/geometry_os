; DESCRIPTION: Creates a magenta rectangular region at (252, 117) spanning 31 by 17 pixels.
; PLAN: r0=252(x), r1=117(y), r2=31(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 117
LDI r2, 31
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
