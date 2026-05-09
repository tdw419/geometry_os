; DESCRIPTION: Creates a orange rectangular region at (274, 104) spanning 55 by 53 pixels.
; PLAN: r0=274(x), r1=104(y), r2=55(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 104
LDI r2, 55
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
