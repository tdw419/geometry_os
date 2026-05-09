; DESCRIPTION: Creates a purple rectangular region at (434, 24) spanning 51 by 92 pixels.
; PLAN: r0=434(x), r1=24(y), r2=51(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 24
LDI r2, 51
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
