; DESCRIPTION: Creates a orange rectangular region at (96, 70) spanning 75 by 41 pixels.
; PLAN: r0=96(x), r1=70(y), r2=75(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 70
LDI r2, 75
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
