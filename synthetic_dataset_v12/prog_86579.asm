; DESCRIPTION: Creates a orange rectangular region at (278, 171) spanning 66 by 53 pixels.
; PLAN: r0=278(x), r1=171(y), r2=66(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 171
LDI r2, 66
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
