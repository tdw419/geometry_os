; DESCRIPTION: Creates a black rectangular region at (300, 66) spanning 70 by 102 pixels.
; PLAN: r0=300(x), r1=66(y), r2=70(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 66
LDI r2, 70
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
