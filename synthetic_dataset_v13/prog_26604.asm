; DESCRIPTION: Creates a blue rectangular region at (375, 52) spanning 66 by 29 pixels.
; PLAN: r0=375(x), r1=52(y), r2=66(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 52
LDI r2, 66
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
