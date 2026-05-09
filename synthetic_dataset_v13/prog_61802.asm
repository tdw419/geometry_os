; DESCRIPTION: Creates a blue rectangular region at (287, 100) spanning 34 by 51 pixels.
; PLAN: r0=287(x), r1=100(y), r2=34(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 100
LDI r2, 34
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
