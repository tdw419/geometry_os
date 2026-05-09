; DESCRIPTION: Creates a blue rectangular region at (57, 185) spanning 13 by 58 pixels.
; PLAN: r0=57(x), r1=185(y), r2=13(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 185
LDI r2, 13
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
