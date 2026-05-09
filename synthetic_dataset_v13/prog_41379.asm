; DESCRIPTION: Creates a orange rectangular region at (84, 31) spanning 117 by 86 pixels.
; PLAN: r0=84(x), r1=31(y), r2=117(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 31
LDI r2, 117
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
