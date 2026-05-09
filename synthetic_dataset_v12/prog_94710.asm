; DESCRIPTION: Creates a blue rectangular region at (190, 240) spanning 108 by 12 pixels.
; PLAN: r0=190(x), r1=240(y), r2=108(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 240
LDI r2, 108
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
