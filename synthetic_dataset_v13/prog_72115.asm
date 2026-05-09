; DESCRIPTION: Creates a magenta rectangular region at (175, 8) spanning 53 by 108 pixels.
; PLAN: r0=175(x), r1=8(y), r2=53(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 8
LDI r2, 53
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
