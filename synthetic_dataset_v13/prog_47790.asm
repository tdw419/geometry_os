; DESCRIPTION: Creates a orange rectangular region at (417, 127) spanning 68 by 115 pixels.
; PLAN: r0=417(x), r1=127(y), r2=68(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 127
LDI r2, 68
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
