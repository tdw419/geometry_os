; DESCRIPTION: Creates a orange rectangular region at (207, 138) spanning 35 by 49 pixels.
; PLAN: r0=207(x), r1=138(y), r2=35(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 138
LDI r2, 35
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
