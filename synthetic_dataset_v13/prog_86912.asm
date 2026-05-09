; DESCRIPTION: Creates a purple rectangular region at (317, 105) spanning 104 by 81 pixels.
; PLAN: r0=317(x), r1=105(y), r2=104(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 105
LDI r2, 104
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
