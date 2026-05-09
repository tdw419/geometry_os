; DESCRIPTION: Creates a purple rectangular region at (107, 105) spanning 11 by 93 pixels.
; PLAN: r0=107(x), r1=105(y), r2=11(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 105
LDI r2, 11
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
