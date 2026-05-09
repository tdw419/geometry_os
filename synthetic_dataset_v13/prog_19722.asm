; DESCRIPTION: Creates a orange rectangular region at (90, 145) spanning 115 by 13 pixels.
; PLAN: r0=90(x), r1=145(y), r2=115(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 145
LDI r2, 115
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
