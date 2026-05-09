; DESCRIPTION: Creates a orange rectangular region at (32, 104) spanning 108 by 76 pixels.
; PLAN: r0=32(x), r1=104(y), r2=108(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 104
LDI r2, 108
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
