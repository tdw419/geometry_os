; DESCRIPTION: Creates a orange rectangular region at (173, 135) spanning 118 by 119 pixels.
; PLAN: r0=173(x), r1=135(y), r2=118(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 135
LDI r2, 118
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
