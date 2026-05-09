; DESCRIPTION: Creates a blue rectangular region at (233, 28) spanning 69 by 49 pixels.
; PLAN: r0=233(x), r1=28(y), r2=69(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 28
LDI r2, 69
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
