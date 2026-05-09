; DESCRIPTION: Creates a orange rectangular region at (110, 117) spanning 69 by 36 pixels.
; PLAN: r0=110(x), r1=117(y), r2=69(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 117
LDI r2, 69
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
