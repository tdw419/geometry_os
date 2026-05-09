; DESCRIPTION: Creates a magenta rectangular region at (23, 146) spanning 40 by 108 pixels.
; PLAN: r0=23(x), r1=146(y), r2=40(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 146
LDI r2, 40
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
