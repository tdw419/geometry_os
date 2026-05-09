; DESCRIPTION: Creates a blue rectangular region at (187, 102) spanning 75 by 78 pixels.
; PLAN: r0=187(x), r1=102(y), r2=75(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 102
LDI r2, 75
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
