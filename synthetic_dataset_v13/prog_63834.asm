; DESCRIPTION: Creates a green rectangular region at (208, 134) spanning 49 by 105 pixels.
; PLAN: r0=208(x), r1=134(y), r2=49(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 134
LDI r2, 49
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
