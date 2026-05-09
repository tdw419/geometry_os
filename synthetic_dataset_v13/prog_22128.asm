; DESCRIPTION: Creates a blue rectangular region at (350, 84) spanning 38 by 93 pixels.
; PLAN: r0=350(x), r1=84(y), r2=38(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 84
LDI r2, 38
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
