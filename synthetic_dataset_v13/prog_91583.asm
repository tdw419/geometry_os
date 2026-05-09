; DESCRIPTION: Creates a blue rectangular region at (418, 83) spanning 20 by 102 pixels.
; PLAN: r0=418(x), r1=83(y), r2=20(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 83
LDI r2, 20
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
