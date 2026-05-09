; DESCRIPTION: Creates a blue rectangular region at (69, 181) spanning 16 by 51 pixels.
; PLAN: r0=69(x), r1=181(y), r2=16(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 181
LDI r2, 16
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
