; DESCRIPTION: Creates a orange rectangular region at (316, 51) spanning 42 by 77 pixels.
; PLAN: r0=316(x), r1=51(y), r2=42(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 51
LDI r2, 42
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
