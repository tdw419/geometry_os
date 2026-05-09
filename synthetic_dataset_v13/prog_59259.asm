; DESCRIPTION: Creates a blue rectangular region at (105, 76) spanning 115 by 91 pixels.
; PLAN: r0=105(x), r1=76(y), r2=115(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 76
LDI r2, 115
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
