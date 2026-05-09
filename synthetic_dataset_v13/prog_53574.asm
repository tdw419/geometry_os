; DESCRIPTION: Creates a orange rectangular region at (205, 138) spanning 99 by 99 pixels.
; PLAN: r0=205(x), r1=138(y), r2=99(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 138
LDI r2, 99
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
