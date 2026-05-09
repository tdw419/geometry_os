; DESCRIPTION: Creates a orange rectangular region at (9, 65) spanning 104 by 99 pixels.
; PLAN: r0=9(x), r1=65(y), r2=104(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 65
LDI r2, 104
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
