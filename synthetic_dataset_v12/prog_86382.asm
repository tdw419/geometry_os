; DESCRIPTION: Creates a blue rectangular region at (223, 153) spanning 96 by 97 pixels.
; PLAN: r0=223(x), r1=153(y), r2=96(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 153
LDI r2, 96
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
