; DESCRIPTION: Creates a magenta rectangular region at (137, 121) spanning 26 by 65 pixels.
; PLAN: r0=137(x), r1=121(y), r2=26(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 121
LDI r2, 26
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
