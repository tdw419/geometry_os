; DESCRIPTION: Creates a blue rectangular region at (378, 60) spanning 90 by 99 pixels.
; PLAN: r0=378(x), r1=60(y), r2=90(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 60
LDI r2, 90
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
