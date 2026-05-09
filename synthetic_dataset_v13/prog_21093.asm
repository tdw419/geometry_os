; DESCRIPTION: Creates a orange rectangular region at (163, 149) spanning 118 by 44 pixels.
; PLAN: r0=163(x), r1=149(y), r2=118(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 149
LDI r2, 118
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
