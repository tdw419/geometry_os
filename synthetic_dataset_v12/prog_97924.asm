; DESCRIPTION: Creates a orange rectangular region at (334, 16) spanning 90 by 107 pixels.
; PLAN: r0=334(x), r1=16(y), r2=90(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 16
LDI r2, 90
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
