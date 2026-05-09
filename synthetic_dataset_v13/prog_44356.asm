; DESCRIPTION: Creates a orange rectangular region at (117, 110) spanning 54 by 87 pixels.
; PLAN: r0=117(x), r1=110(y), r2=54(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 110
LDI r2, 54
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
