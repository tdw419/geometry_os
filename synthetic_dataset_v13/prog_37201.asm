; DESCRIPTION: Creates a blue rectangular region at (90, 8) spanning 108 by 80 pixels.
; PLAN: r0=90(x), r1=8(y), r2=108(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 8
LDI r2, 108
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
