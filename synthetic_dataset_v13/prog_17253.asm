; DESCRIPTION: Creates a orange rectangular region at (145, 118) spanning 102 by 104 pixels.
; PLAN: r0=145(x), r1=118(y), r2=102(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 118
LDI r2, 102
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
