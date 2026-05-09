; DESCRIPTION: Creates a orange rectangular region at (121, 78) spanning 105 by 40 pixels.
; PLAN: r0=121(x), r1=78(y), r2=105(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 78
LDI r2, 105
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
