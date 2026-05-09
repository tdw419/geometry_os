; DESCRIPTION: Creates a orange rectangular region at (7, 57) spanning 116 by 98 pixels.
; PLAN: r0=7(x), r1=57(y), r2=116(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
