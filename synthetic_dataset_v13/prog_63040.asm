; DESCRIPTION: Creates a orange rectangular region at (269, 16) spanning 99 by 85 pixels.
; PLAN: r0=269(x), r1=16(y), r2=99(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 16
LDI r2, 99
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
