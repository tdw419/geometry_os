; DESCRIPTION: Creates a blue rectangular region at (66, 145) spanning 54 by 35 pixels.
; PLAN: r0=66(x), r1=145(y), r2=54(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 145
LDI r2, 54
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
