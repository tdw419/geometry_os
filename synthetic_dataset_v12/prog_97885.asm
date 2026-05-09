; DESCRIPTION: Creates a magenta rectangular region at (410, 149) spanning 88 by 46 pixels.
; PLAN: r0=410(x), r1=149(y), r2=88(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 149
LDI r2, 88
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
