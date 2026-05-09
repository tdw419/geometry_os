; DESCRIPTION: Creates a orange rectangular region at (432, 138) spanning 37 by 57 pixels.
; PLAN: r0=432(x), r1=138(y), r2=37(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 138
LDI r2, 37
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
