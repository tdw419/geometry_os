; DESCRIPTION: Creates a orange rectangular region at (11, 42) spanning 48 by 100 pixels.
; PLAN: r0=11(x), r1=42(y), r2=48(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 42
LDI r2, 48
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
