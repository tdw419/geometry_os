; DESCRIPTION: Creates a blue rectangular region at (391, 88) spanning 90 by 47 pixels.
; PLAN: r0=391(x), r1=88(y), r2=90(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 88
LDI r2, 90
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
