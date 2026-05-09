; DESCRIPTION: Creates a purple rectangular region at (447, 51) spanning 63 by 35 pixels.
; PLAN: r0=447(x), r1=51(y), r2=63(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 51
LDI r2, 63
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
