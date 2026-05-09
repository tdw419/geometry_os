; DESCRIPTION: Creates a orange rectangular region at (374, 70) spanning 118 by 102 pixels.
; PLAN: r0=374(x), r1=70(y), r2=118(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 70
LDI r2, 118
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
