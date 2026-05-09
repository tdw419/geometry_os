; DESCRIPTION: Creates a blue rectangular region at (274, 219) spanning 90 by 15 pixels.
; PLAN: r0=274(x), r1=219(y), r2=90(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 219
LDI r2, 90
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
