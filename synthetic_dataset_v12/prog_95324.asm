; DESCRIPTION: Creates a orange rectangular region at (2, 79) spanning 39 by 14 pixels.
; PLAN: r0=2(x), r1=79(y), r2=39(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 79
LDI r2, 39
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
