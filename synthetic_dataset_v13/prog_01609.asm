; DESCRIPTION: Creates a white rectangular region at (288, 34) spanning 114 by 117 pixels.
; PLAN: r0=288(x), r1=34(y), r2=114(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 34
LDI r2, 114
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
