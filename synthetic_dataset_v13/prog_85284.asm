; DESCRIPTION: Creates a blue rectangular region at (347, 38) spanning 51 by 72 pixels.
; PLAN: r0=347(x), r1=38(y), r2=51(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 38
LDI r2, 51
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
