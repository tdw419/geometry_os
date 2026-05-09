; DESCRIPTION: Creates a black rectangular region at (21, 116) spanning 22 by 34 pixels.
; PLAN: r0=21(x), r1=116(y), r2=22(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 116
LDI r2, 22
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
