; DESCRIPTION: Creates a orange rectangular region at (27, 79) spanning 75 by 85 pixels.
; PLAN: r0=27(x), r1=79(y), r2=75(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 79
LDI r2, 75
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
