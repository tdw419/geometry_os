; DESCRIPTION: Creates a blue rectangular region at (9, 188) spanning 70 by 17 pixels.
; PLAN: r0=9(x), r1=188(y), r2=70(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 188
LDI r2, 70
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
