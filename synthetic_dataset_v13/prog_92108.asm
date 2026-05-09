; DESCRIPTION: Creates a orange rectangular region at (335, 69) spanning 12 by 96 pixels.
; PLAN: r0=335(x), r1=69(y), r2=12(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 69
LDI r2, 12
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
