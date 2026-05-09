; DESCRIPTION: Creates a orange rectangular region at (11, 79) spanning 25 by 72 pixels.
; PLAN: r0=11(x), r1=79(y), r2=25(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 79
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
