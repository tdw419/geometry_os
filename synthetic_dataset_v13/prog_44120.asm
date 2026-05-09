; DESCRIPTION: Creates a orange rectangular region at (355, 65) spanning 107 by 37 pixels.
; PLAN: r0=355(x), r1=65(y), r2=107(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 65
LDI r2, 107
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
