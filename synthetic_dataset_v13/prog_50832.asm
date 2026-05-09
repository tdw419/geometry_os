; DESCRIPTION: Creates a orange rectangular region at (198, 188) spanning 23 by 62 pixels.
; PLAN: r0=198(x), r1=188(y), r2=23(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 188
LDI r2, 23
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
