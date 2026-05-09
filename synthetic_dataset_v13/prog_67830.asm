; DESCRIPTION: Creates a orange rectangular region at (278, 101) spanning 81 by 86 pixels.
; PLAN: r0=278(x), r1=101(y), r2=81(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 101
LDI r2, 81
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
