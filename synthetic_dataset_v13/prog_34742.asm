; DESCRIPTION: Creates a magenta rectangular region at (101, 165) spanning 119 by 91 pixels.
; PLAN: r0=101(x), r1=165(y), r2=119(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 165
LDI r2, 119
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
