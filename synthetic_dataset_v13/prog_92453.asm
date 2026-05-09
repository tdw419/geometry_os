; DESCRIPTION: Creates a orange rectangular region at (154, 57) spanning 96 by 114 pixels.
; PLAN: r0=154(x), r1=57(y), r2=96(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 57
LDI r2, 96
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
