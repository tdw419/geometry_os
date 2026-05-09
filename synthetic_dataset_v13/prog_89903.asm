; DESCRIPTION: Creates a orange rectangular region at (301, 83) spanning 32 by 120 pixels.
; PLAN: r0=301(x), r1=83(y), r2=32(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 83
LDI r2, 32
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
