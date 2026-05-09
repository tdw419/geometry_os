; DESCRIPTION: Creates a orange rectangular region at (301, 104) spanning 117 by 38 pixels.
; PLAN: r0=301(x), r1=104(y), r2=117(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 104
LDI r2, 117
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
