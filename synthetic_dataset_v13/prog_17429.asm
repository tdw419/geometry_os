; DESCRIPTION: Creates a orange rectangular region at (324, 35) spanning 56 by 56 pixels.
; PLAN: r0=324(x), r1=35(y), r2=56(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 35
LDI r2, 56
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
