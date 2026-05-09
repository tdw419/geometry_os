; DESCRIPTION: Creates a orange rectangular region at (134, 10) spanning 84 by 90 pixels.
; PLAN: r0=134(x), r1=10(y), r2=84(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 10
LDI r2, 84
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
