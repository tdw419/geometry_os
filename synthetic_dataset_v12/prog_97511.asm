; DESCRIPTION: Creates a orange rectangular region at (220, 56) spanning 117 by 31 pixels.
; PLAN: r0=220(x), r1=56(y), r2=117(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 56
LDI r2, 117
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
