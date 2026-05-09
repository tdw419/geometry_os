; DESCRIPTION: Creates a orange rectangular region at (35, 1) spanning 29 by 95 pixels.
; PLAN: r0=35(x), r1=1(y), r2=29(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 1
LDI r2, 29
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
