; DESCRIPTION: Creates a magenta rectangular region at (344, 18) spanning 68 by 23 pixels.
; PLAN: r0=344(x), r1=18(y), r2=68(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 18
LDI r2, 68
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
