; DESCRIPTION: Creates a orange rectangular region at (363, 6) spanning 42 by 102 pixels.
; PLAN: r0=363(x), r1=6(y), r2=42(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 6
LDI r2, 42
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
