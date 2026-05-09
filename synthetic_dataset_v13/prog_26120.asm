; DESCRIPTION: Creates a orange rectangular region at (12, 100) spanning 84 by 117 pixels.
; PLAN: r0=12(x), r1=100(y), r2=84(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 100
LDI r2, 84
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
