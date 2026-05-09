; DESCRIPTION: Creates a orange rectangular region at (70, 110) spanning 58 by 86 pixels.
; PLAN: r0=70(x), r1=110(y), r2=58(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 110
LDI r2, 58
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
