; DESCRIPTION: Creates a black rectangular region at (70, 54) spanning 34 by 73 pixels.
; PLAN: r0=70(x), r1=54(y), r2=34(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 54
LDI r2, 34
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
