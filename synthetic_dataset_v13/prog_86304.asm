; DESCRIPTION: Creates a blue rectangular region at (447, 3) spanning 51 by 59 pixels.
; PLAN: r0=447(x), r1=3(y), r2=51(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 3
LDI r2, 51
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
