; DESCRIPTION: Creates a orange rectangular region at (313, 92) spanning 104 by 74 pixels.
; PLAN: r0=313(x), r1=92(y), r2=104(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 92
LDI r2, 104
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
