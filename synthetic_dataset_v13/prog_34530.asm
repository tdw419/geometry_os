; DESCRIPTION: Creates a white rectangular region at (223, 0) spanning 119 by 69 pixels.
; PLAN: r0=223(x), r1=0(y), r2=119(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 0
LDI r2, 119
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
