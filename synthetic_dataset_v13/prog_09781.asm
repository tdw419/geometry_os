; DESCRIPTION: Creates a orange rectangular region at (396, 172) spanning 63 by 79 pixels.
; PLAN: r0=396(x), r1=172(y), r2=63(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 172
LDI r2, 63
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
