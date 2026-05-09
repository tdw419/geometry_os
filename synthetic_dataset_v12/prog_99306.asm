; DESCRIPTION: Creates a black rectangular region at (116, 175) spanning 80 by 52 pixels.
; PLAN: r0=116(x), r1=175(y), r2=80(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 175
LDI r2, 80
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
