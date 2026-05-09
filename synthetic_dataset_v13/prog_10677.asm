; DESCRIPTION: Creates a orange rectangular region at (278, 114) spanning 36 by 105 pixels.
; PLAN: r0=278(x), r1=114(y), r2=36(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 114
LDI r2, 36
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
