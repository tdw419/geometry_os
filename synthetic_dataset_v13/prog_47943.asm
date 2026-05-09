; DESCRIPTION: Creates a blue rectangular region at (220, 109) spanning 17 by 49 pixels.
; PLAN: r0=220(x), r1=109(y), r2=17(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 109
LDI r2, 17
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
