; DESCRIPTION: Creates a magenta rectangular region at (76, 53) spanning 79 by 13 pixels.
; PLAN: r0=76(x), r1=53(y), r2=79(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 53
LDI r2, 79
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
