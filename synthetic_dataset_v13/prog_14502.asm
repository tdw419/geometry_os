; DESCRIPTION: Creates a orange rectangular region at (349, 108) spanning 118 by 117 pixels.
; PLAN: r0=349(x), r1=108(y), r2=118(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 108
LDI r2, 118
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
