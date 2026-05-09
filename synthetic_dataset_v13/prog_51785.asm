; DESCRIPTION: Creates a white rectangular region at (366, 46) spanning 85 by 69 pixels.
; PLAN: r0=366(x), r1=46(y), r2=85(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 46
LDI r2, 85
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
