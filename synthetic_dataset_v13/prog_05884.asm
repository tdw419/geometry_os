; DESCRIPTION: Creates a green rectangular region at (303, 115) spanning 116 by 76 pixels.
; PLAN: r0=303(x), r1=115(y), r2=116(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 115
LDI r2, 116
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
