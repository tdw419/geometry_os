; DESCRIPTION: Creates a orange rectangular region at (236, 53) spanning 116 by 104 pixels.
; PLAN: r0=236(x), r1=53(y), r2=116(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 53
LDI r2, 116
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
