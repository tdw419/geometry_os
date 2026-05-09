; DESCRIPTION: Creates a blue rectangular region at (341, 162) spanning 13 by 94 pixels.
; PLAN: r0=341(x), r1=162(y), r2=13(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 162
LDI r2, 13
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
