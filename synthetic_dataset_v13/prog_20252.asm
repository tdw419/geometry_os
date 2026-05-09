; DESCRIPTION: Creates a orange rectangular region at (155, 187) spanning 79 by 49 pixels.
; PLAN: r0=155(x), r1=187(y), r2=79(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 187
LDI r2, 79
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
