; DESCRIPTION: Creates a orange rectangular region at (183, 92) spanning 51 by 77 pixels.
; PLAN: r0=183(x), r1=92(y), r2=51(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 92
LDI r2, 51
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
