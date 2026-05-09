; DESCRIPTION: Creates a orange rectangular region at (196, 170) spanning 90 by 65 pixels.
; PLAN: r0=196(x), r1=170(y), r2=90(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 170
LDI r2, 90
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
