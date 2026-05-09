; DESCRIPTION: Creates a orange rectangular region at (160, 38) spanning 114 by 72 pixels.
; PLAN: r0=160(x), r1=38(y), r2=114(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 38
LDI r2, 114
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
