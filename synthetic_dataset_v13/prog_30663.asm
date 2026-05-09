; DESCRIPTION: Creates a orange rectangular region at (135, 70) spanning 118 by 115 pixels.
; PLAN: r0=135(x), r1=70(y), r2=118(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 70
LDI r2, 118
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
