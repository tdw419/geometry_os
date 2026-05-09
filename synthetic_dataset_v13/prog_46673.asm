; DESCRIPTION: Creates a white rectangular region at (102, 189) spanning 119 by 13 pixels.
; PLAN: r0=102(x), r1=189(y), r2=119(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 189
LDI r2, 119
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
