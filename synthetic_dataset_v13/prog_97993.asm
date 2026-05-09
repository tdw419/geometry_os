; DESCRIPTION: Creates a magenta rectangular region at (428, 26) spanning 35 by 39 pixels.
; PLAN: r0=428(x), r1=26(y), r2=35(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 26
LDI r2, 35
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
