; DESCRIPTION: Creates a blue rectangular region at (255, 106) spanning 56 by 73 pixels.
; PLAN: r0=255(x), r1=106(y), r2=56(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 106
LDI r2, 56
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
