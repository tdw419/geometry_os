; DESCRIPTION: Creates a red rectangular region at (216, 92) spanning 85 by 99 pixels.
; PLAN: r0=216(x), r1=92(y), r2=85(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 92
LDI r2, 85
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
