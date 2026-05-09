; DESCRIPTION: Creates a orange rectangular region at (291, 188) spanning 61 by 23 pixels.
; PLAN: r0=291(x), r1=188(y), r2=61(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 188
LDI r2, 61
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
