; DESCRIPTION: Creates a orange rectangular region at (356, 122) spanning 75 by 98 pixels.
; PLAN: r0=356(x), r1=122(y), r2=75(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 122
LDI r2, 75
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
