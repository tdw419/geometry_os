; DESCRIPTION: Creates a blue rectangular region at (233, 36) spanning 55 by 30 pixels.
; PLAN: r0=233(x), r1=36(y), r2=55(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 36
LDI r2, 55
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
