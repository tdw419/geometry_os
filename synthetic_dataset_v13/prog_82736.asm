; DESCRIPTION: Creates a blue rectangular region at (221, 35) spanning 35 by 84 pixels.
; PLAN: r0=221(x), r1=35(y), r2=35(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 35
LDI r2, 35
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
