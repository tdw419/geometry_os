; DESCRIPTION: Creates a magenta rectangular region at (216, 41) spanning 70 by 90 pixels.
; PLAN: r0=216(x), r1=41(y), r2=70(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 41
LDI r2, 70
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
