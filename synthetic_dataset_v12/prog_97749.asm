; DESCRIPTION: Creates a red rectangular region at (101, 67) spanning 79 by 13 pixels.
; PLAN: r0=101(x), r1=67(y), r2=79(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 67
LDI r2, 79
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
