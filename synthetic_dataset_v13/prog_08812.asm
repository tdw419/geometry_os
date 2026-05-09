; DESCRIPTION: Creates a orange rectangular region at (44, 61) spanning 39 by 58 pixels.
; PLAN: r0=44(x), r1=61(y), r2=39(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 61
LDI r2, 39
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
