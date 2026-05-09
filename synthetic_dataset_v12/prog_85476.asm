; DESCRIPTION: Creates a blue rectangular region at (255, 174) spanning 89 by 35 pixels.
; PLAN: r0=255(x), r1=174(y), r2=89(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 174
LDI r2, 89
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
