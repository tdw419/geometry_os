; DESCRIPTION: Creates a orange rectangular region at (193, 188) spanning 72 by 68 pixels.
; PLAN: r0=193(x), r1=188(y), r2=72(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 188
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
