; DESCRIPTION: Creates a orange rectangular region at (428, 24) spanning 20 by 66 pixels.
; PLAN: r0=428(x), r1=24(y), r2=20(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 24
LDI r2, 20
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
