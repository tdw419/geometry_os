; DESCRIPTION: Creates a orange rectangular region at (18, 56) spanning 101 by 16 pixels.
; PLAN: r0=18(x), r1=56(y), r2=101(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 56
LDI r2, 101
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
