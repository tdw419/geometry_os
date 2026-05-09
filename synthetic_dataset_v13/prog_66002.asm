; DESCRIPTION: Creates a orange rectangular region at (75, 9) spanning 13 by 92 pixels.
; PLAN: r0=75(x), r1=9(y), r2=13(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 9
LDI r2, 13
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
