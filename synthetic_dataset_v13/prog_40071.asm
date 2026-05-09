; DESCRIPTION: Creates a orange rectangular region at (283, 76) spanning 94 by 61 pixels.
; PLAN: r0=283(x), r1=76(y), r2=94(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 76
LDI r2, 94
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
