; DESCRIPTION: Creates a orange rectangular region at (24, 35) spanning 75 by 104 pixels.
; PLAN: r0=24(x), r1=35(y), r2=75(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 35
LDI r2, 75
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
