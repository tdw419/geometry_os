; DESCRIPTION: Creates a orange rectangular region at (281, 6) spanning 100 by 32 pixels.
; PLAN: r0=281(x), r1=6(y), r2=100(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 6
LDI r2, 100
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
