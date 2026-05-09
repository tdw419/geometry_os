; DESCRIPTION: Creates a orange rectangular region at (414, 135) spanning 29 by 96 pixels.
; PLAN: r0=414(x), r1=135(y), r2=29(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 135
LDI r2, 29
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
