; DESCRIPTION: Creates a red rectangular region at (472, 9) spanning 17 by 79 pixels.
; PLAN: r0=472(x), r1=9(y), r2=17(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 9
LDI r2, 17
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
