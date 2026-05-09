; DESCRIPTION: Creates a orange rectangular region at (118, 43) spanning 76 by 40 pixels.
; PLAN: r0=118(x), r1=43(y), r2=76(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 76
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
