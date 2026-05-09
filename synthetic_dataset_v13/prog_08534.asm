; DESCRIPTION: Creates a orange rectangular region at (328, 98) spanning 119 by 100 pixels.
; PLAN: r0=328(x), r1=98(y), r2=119(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 98
LDI r2, 119
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
