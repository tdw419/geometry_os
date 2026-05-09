; DESCRIPTION: Creates a orange rectangular region at (304, 102) spanning 63 by 39 pixels.
; PLAN: r0=304(x), r1=102(y), r2=63(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 102
LDI r2, 63
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
