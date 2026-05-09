; DESCRIPTION: Creates a blue rectangular region at (482, 133) spanning 24 by 51 pixels.
; PLAN: r0=482(x), r1=133(y), r2=24(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 133
LDI r2, 24
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
