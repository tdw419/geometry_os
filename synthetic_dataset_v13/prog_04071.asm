; DESCRIPTION: Creates a orange rectangular region at (375, 87) spanning 118 by 87 pixels.
; PLAN: r0=375(x), r1=87(y), r2=118(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 87
LDI r2, 118
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
