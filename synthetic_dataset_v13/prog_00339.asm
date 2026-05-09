; DESCRIPTION: Creates a orange rectangular region at (85, 152) spanning 101 by 17 pixels.
; PLAN: r0=85(x), r1=152(y), r2=101(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 152
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
