; DESCRIPTION: Creates a purple rectangular region at (461, 3) spanning 50 by 51 pixels.
; PLAN: r0=461(x), r1=3(y), r2=50(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 3
LDI r2, 50
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
