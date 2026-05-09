; DESCRIPTION: Creates a blue rectangular region at (221, 4) spanning 74 by 62 pixels.
; PLAN: r0=221(x), r1=4(y), r2=74(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 4
LDI r2, 74
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
