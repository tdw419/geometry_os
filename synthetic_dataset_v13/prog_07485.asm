; DESCRIPTION: Creates a orange rectangular region at (276, 31) spanning 103 by 115 pixels.
; PLAN: r0=276(x), r1=31(y), r2=103(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 31
LDI r2, 103
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
