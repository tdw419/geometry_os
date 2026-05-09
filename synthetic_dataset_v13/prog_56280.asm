; DESCRIPTION: Creates a orange rectangular region at (172, 75) spanning 79 by 70 pixels.
; PLAN: r0=172(x), r1=75(y), r2=79(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 75
LDI r2, 79
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
