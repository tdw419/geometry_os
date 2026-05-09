; DESCRIPTION: Creates a orange rectangular region at (355, 167) spanning 63 by 70 pixels.
; PLAN: r0=355(x), r1=167(y), r2=63(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 167
LDI r2, 63
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
