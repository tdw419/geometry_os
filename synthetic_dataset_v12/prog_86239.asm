; DESCRIPTION: Creates a orange rectangular region at (85, 138) spanning 51 by 21 pixels.
; PLAN: r0=85(x), r1=138(y), r2=51(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 138
LDI r2, 51
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
