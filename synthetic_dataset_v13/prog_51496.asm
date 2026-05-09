; DESCRIPTION: Creates a orange rectangular region at (85, 128) spanning 23 by 120 pixels.
; PLAN: r0=85(x), r1=128(y), r2=23(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 128
LDI r2, 23
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
