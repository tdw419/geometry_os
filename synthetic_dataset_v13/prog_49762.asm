; DESCRIPTION: Creates a orange rectangular region at (232, 103) spanning 83 by 18 pixels.
; PLAN: r0=232(x), r1=103(y), r2=83(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 103
LDI r2, 83
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
