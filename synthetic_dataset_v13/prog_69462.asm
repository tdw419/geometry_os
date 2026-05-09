; DESCRIPTION: Creates a magenta rectangular region at (428, 123) spanning 68 by 38 pixels.
; PLAN: r0=428(x), r1=123(y), r2=68(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 123
LDI r2, 68
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
