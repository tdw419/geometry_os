; DESCRIPTION: Creates a orange rectangular region at (14, 37) spanning 57 by 117 pixels.
; PLAN: r0=14(x), r1=37(y), r2=57(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 37
LDI r2, 57
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
