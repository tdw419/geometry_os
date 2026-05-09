; DESCRIPTION: Creates a orange rectangular region at (122, 42) spanning 99 by 54 pixels.
; PLAN: r0=122(x), r1=42(y), r2=99(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 42
LDI r2, 99
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
