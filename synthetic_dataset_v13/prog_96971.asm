; DESCRIPTION: Creates a orange rectangular region at (186, 115) spanning 26 by 99 pixels.
; PLAN: r0=186(x), r1=115(y), r2=26(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 115
LDI r2, 26
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
