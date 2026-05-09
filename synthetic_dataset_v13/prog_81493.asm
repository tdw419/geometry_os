; DESCRIPTION: Creates a orange rectangular region at (232, 107) spanning 67 by 112 pixels.
; PLAN: r0=232(x), r1=107(y), r2=67(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 107
LDI r2, 67
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
