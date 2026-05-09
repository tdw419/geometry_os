; DESCRIPTION: Creates a orange rectangular region at (452, 181) spanning 17 by 30 pixels.
; PLAN: r0=452(x), r1=181(y), r2=17(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 181
LDI r2, 17
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
