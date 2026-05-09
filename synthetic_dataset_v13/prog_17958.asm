; DESCRIPTION: Creates a orange rectangular region at (63, 158) spanning 65 by 22 pixels.
; PLAN: r0=63(x), r1=158(y), r2=65(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 158
LDI r2, 65
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
