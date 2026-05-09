; DESCRIPTION: Creates a orange rectangular region at (47, 43) spanning 104 by 32 pixels.
; PLAN: r0=47(x), r1=43(y), r2=104(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 43
LDI r2, 104
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
