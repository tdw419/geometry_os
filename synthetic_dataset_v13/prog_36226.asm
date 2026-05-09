; DESCRIPTION: Creates a blue rectangular region at (138, 117) spanning 84 by 30 pixels.
; PLAN: r0=138(x), r1=117(y), r2=84(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 117
LDI r2, 84
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
