; DESCRIPTION: Creates a orange rectangular region at (127, 9) spanning 119 by 21 pixels.
; PLAN: r0=127(x), r1=9(y), r2=119(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 9
LDI r2, 119
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
