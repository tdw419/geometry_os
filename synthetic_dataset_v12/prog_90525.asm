; DESCRIPTION: Creates a blue rectangular region at (441, 4) spanning 36 by 108 pixels.
; PLAN: r0=441(x), r1=4(y), r2=36(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 4
LDI r2, 36
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
