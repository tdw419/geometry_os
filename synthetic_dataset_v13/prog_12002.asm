; DESCRIPTION: Creates a magenta rectangular region at (101, 134) spanning 17 by 13 pixels.
; PLAN: r0=101(x), r1=134(y), r2=17(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 134
LDI r2, 17
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
