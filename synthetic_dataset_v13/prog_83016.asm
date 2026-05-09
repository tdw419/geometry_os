; DESCRIPTION: Creates a green rectangular region at (14, 125) spanning 112 by 76 pixels.
; PLAN: r0=14(x), r1=125(y), r2=112(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 125
LDI r2, 112
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
