; DESCRIPTION: Creates a orange rectangular region at (236, 62) spanning 72 by 70 pixels.
; PLAN: r0=236(x), r1=62(y), r2=72(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 62
LDI r2, 72
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
