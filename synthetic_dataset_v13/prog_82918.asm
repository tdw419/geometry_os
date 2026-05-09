; DESCRIPTION: Creates a blue rectangular region at (435, 5) spanning 56 by 49 pixels.
; PLAN: r0=435(x), r1=5(y), r2=56(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 5
LDI r2, 56
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
