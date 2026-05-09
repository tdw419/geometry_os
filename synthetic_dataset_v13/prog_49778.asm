; DESCRIPTION: Creates a red rectangular region at (17, 105) spanning 104 by 56 pixels.
; PLAN: r0=17(x), r1=105(y), r2=104(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 105
LDI r2, 104
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
