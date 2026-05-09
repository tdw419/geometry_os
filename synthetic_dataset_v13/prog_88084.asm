; DESCRIPTION: Creates a blue rectangular region at (164, 122) spanning 54 by 83 pixels.
; PLAN: r0=164(x), r1=122(y), r2=54(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 122
LDI r2, 54
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
