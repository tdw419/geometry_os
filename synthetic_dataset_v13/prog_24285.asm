; DESCRIPTION: Creates a yellow rectangular region at (70, 41) spanning 80 by 116 pixels.
; PLAN: r0=70(x), r1=41(y), r2=80(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 41
LDI r2, 80
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
