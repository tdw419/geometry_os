; DESCRIPTION: Creates a purple rectangular region at (51, 168) spanning 72 by 74 pixels.
; PLAN: r0=51(x), r1=168(y), r2=72(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 168
LDI r2, 72
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
