; DESCRIPTION: Creates a orange rectangular region at (364, 51) spanning 63 by 55 pixels.
; PLAN: r0=364(x), r1=51(y), r2=63(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 51
LDI r2, 63
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
