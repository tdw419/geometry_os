; DESCRIPTION: Creates a blue rectangular region at (188, 181) spanning 51 by 31 pixels.
; PLAN: r0=188(x), r1=181(y), r2=51(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 181
LDI r2, 51
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
