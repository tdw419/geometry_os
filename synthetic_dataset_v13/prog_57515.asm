; DESCRIPTION: Creates a orange rectangular region at (18, 43) spanning 47 by 75 pixels.
; PLAN: r0=18(x), r1=43(y), r2=47(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 47
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
