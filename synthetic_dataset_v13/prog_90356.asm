; DESCRIPTION: Creates a orange rectangular region at (125, 144) spanning 79 by 11 pixels.
; PLAN: r0=125(x), r1=144(y), r2=79(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 144
LDI r2, 79
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
