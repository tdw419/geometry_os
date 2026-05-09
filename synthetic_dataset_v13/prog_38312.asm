; DESCRIPTION: Creates a magenta rectangular region at (155, 16) spanning 46 by 103 pixels.
; PLAN: r0=155(x), r1=16(y), r2=46(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 16
LDI r2, 46
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
