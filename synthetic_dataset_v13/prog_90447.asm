; DESCRIPTION: Creates a orange rectangular region at (225, 64) spanning 43 by 102 pixels.
; PLAN: r0=225(x), r1=64(y), r2=43(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 64
LDI r2, 43
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
