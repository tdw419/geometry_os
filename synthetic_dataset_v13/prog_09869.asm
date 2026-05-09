; DESCRIPTION: Creates a black rectangular region at (407, 173) spanning 74 by 15 pixels.
; PLAN: r0=407(x), r1=173(y), r2=74(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 173
LDI r2, 74
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
