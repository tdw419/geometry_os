; DESCRIPTION: Creates a orange rectangular region at (3, 81) spanning 112 by 45 pixels.
; PLAN: r0=3(x), r1=81(y), r2=112(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 81
LDI r2, 112
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
