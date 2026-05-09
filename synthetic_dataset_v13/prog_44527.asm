; DESCRIPTION: Creates a blue rectangular region at (68, 72) spanning 90 by 17 pixels.
; PLAN: r0=68(x), r1=72(y), r2=90(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 72
LDI r2, 90
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
