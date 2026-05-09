; DESCRIPTION: Creates a orange rectangular region at (104, 88) spanning 79 by 98 pixels.
; PLAN: r0=104(x), r1=88(y), r2=79(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 88
LDI r2, 79
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
