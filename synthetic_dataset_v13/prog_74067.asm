; DESCRIPTION: Creates a white rectangular region at (72, 69) spanning 93 by 119 pixels.
; PLAN: r0=72(x), r1=69(y), r2=93(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 69
LDI r2, 93
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
