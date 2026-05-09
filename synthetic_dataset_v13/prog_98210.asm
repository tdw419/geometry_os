; DESCRIPTION: Creates a orange rectangular region at (319, 177) spanning 100 by 66 pixels.
; PLAN: r0=319(x), r1=177(y), r2=100(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 177
LDI r2, 100
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
