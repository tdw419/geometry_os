; DESCRIPTION: Creates a orange rectangular region at (272, 49) spanning 11 by 105 pixels.
; PLAN: r0=272(x), r1=49(y), r2=11(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 49
LDI r2, 11
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
