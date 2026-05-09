; DESCRIPTION: Creates a purple rectangular region at (169, 32) spanning 51 by 57 pixels.
; PLAN: r0=169(x), r1=32(y), r2=51(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 32
LDI r2, 51
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
