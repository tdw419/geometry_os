; DESCRIPTION: Creates a magenta rectangular region at (117, 69) spanning 99 by 61 pixels.
; PLAN: r0=117(x), r1=69(y), r2=99(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 69
LDI r2, 99
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
