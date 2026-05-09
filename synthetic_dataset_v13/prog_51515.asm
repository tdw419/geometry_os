; DESCRIPTION: Creates a yellow rectangular region at (288, 34) spanning 92 by 116 pixels.
; PLAN: r0=288(x), r1=34(y), r2=92(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 34
LDI r2, 92
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
