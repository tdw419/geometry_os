; DESCRIPTION: Creates a orange rectangular region at (61, 4) spanning 100 by 51 pixels.
; PLAN: r0=61(x), r1=4(y), r2=100(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 4
LDI r2, 100
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
