; DESCRIPTION: Creates a orange rectangular region at (258, 39) spanning 61 by 89 pixels.
; PLAN: r0=258(x), r1=39(y), r2=61(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 39
LDI r2, 61
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
