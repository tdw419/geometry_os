; DESCRIPTION: Creates a orange rectangular region at (81, 68) spanning 16 by 52 pixels.
; PLAN: r0=81(x), r1=68(y), r2=16(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 68
LDI r2, 16
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
