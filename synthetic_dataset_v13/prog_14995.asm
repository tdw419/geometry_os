; DESCRIPTION: Creates a magenta rectangular region at (182, 161) spanning 108 by 26 pixels.
; PLAN: r0=182(x), r1=161(y), r2=108(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 161
LDI r2, 108
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
