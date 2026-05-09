; DESCRIPTION: Creates a orange rectangular region at (466, 193) spanning 28 by 62 pixels.
; PLAN: r0=466(x), r1=193(y), r2=28(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 193
LDI r2, 28
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
