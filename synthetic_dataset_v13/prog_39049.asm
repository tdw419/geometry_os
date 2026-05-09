; DESCRIPTION: Creates a orange rectangular region at (188, 85) spanning 11 by 20 pixels.
; PLAN: r0=188(x), r1=85(y), r2=11(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 85
LDI r2, 11
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
