; DESCRIPTION: Creates a orange rectangular region at (366, 104) spanning 63 by 12 pixels.
; PLAN: r0=366(x), r1=104(y), r2=63(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 104
LDI r2, 63
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
