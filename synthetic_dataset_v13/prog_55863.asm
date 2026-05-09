; DESCRIPTION: Creates a magenta rectangular region at (123, 98) spanning 13 by 26 pixels.
; PLAN: r0=123(x), r1=98(y), r2=13(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 98
LDI r2, 13
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
