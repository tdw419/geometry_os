; DESCRIPTION: Creates a orange rectangular region at (137, 69) spanning 66 by 96 pixels.
; PLAN: r0=137(x), r1=69(y), r2=66(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 69
LDI r2, 66
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
