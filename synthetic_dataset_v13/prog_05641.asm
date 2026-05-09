; DESCRIPTION: Creates a orange rectangular region at (58, 94) spanning 117 by 105 pixels.
; PLAN: r0=58(x), r1=94(y), r2=117(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 94
LDI r2, 117
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
