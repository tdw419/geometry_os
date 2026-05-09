; DESCRIPTION: Creates a orange rectangular region at (205, 123) spanning 93 by 50 pixels.
; PLAN: r0=205(x), r1=123(y), r2=93(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 123
LDI r2, 93
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
