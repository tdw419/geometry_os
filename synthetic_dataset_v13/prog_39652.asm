; DESCRIPTION: Creates a orange rectangular region at (364, 104) spanning 80 by 24 pixels.
; PLAN: r0=364(x), r1=104(y), r2=80(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 104
LDI r2, 80
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
