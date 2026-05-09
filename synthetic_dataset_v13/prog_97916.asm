; DESCRIPTION: Creates a orange rectangular region at (111, 2) spanning 119 by 119 pixels.
; PLAN: r0=111(x), r1=2(y), r2=119(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 2
LDI r2, 119
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
