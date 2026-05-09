; DESCRIPTION: Creates a orange rectangular region at (270, 112) spanning 43 by 62 pixels.
; PLAN: r0=270(x), r1=112(y), r2=43(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 112
LDI r2, 43
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
