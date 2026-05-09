; DESCRIPTION: Creates a purple rectangular region at (51, 9) spanning 65 by 115 pixels.
; PLAN: r0=51(x), r1=9(y), r2=65(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 9
LDI r2, 65
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
