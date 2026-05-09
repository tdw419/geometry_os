; DESCRIPTION: Creates a magenta rectangular region at (90, 99) spanning 13 by 68 pixels.
; PLAN: r0=90(x), r1=99(y), r2=13(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 99
LDI r2, 13
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
