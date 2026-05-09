; DESCRIPTION: Creates a blue rectangular region at (251, 102) spanning 37 by 35 pixels.
; PLAN: r0=251(x), r1=102(y), r2=37(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 102
LDI r2, 37
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
