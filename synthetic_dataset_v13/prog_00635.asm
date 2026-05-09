; DESCRIPTION: Creates a orange rectangular region at (155, 206) spanning 62 by 29 pixels.
; PLAN: r0=155(x), r1=206(y), r2=62(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 206
LDI r2, 62
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
