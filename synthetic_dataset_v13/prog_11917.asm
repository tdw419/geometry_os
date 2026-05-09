; DESCRIPTION: Creates a orange rectangular region at (421, 104) spanning 25 by 36 pixels.
; PLAN: r0=421(x), r1=104(y), r2=25(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 104
LDI r2, 25
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
