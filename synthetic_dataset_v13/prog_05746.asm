; DESCRIPTION: Creates a orange rectangular region at (9, 104) spanning 106 by 86 pixels.
; PLAN: r0=9(x), r1=104(y), r2=106(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 104
LDI r2, 106
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
