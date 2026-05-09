; DESCRIPTION: Creates a green rectangular region at (335, 142) spanning 35 by 74 pixels.
; PLAN: r0=335(x), r1=142(y), r2=35(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 142
LDI r2, 35
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
