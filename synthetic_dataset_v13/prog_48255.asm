; DESCRIPTION: Creates a blue rectangular region at (287, 162) spanning 79 by 37 pixels.
; PLAN: r0=287(x), r1=162(y), r2=79(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 162
LDI r2, 79
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
