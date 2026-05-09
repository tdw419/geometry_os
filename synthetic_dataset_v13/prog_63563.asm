; DESCRIPTION: Creates a purple rectangular region at (349, 0) spanning 61 by 51 pixels.
; PLAN: r0=349(x), r1=0(y), r2=61(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 0
LDI r2, 61
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
