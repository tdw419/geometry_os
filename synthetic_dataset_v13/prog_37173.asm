; DESCRIPTION: Creates a orange rectangular region at (285, 115) spanning 13 by 107 pixels.
; PLAN: r0=285(x), r1=115(y), r2=13(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 115
LDI r2, 13
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
