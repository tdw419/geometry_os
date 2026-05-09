; DESCRIPTION: Creates a purple rectangular region at (79, 35) spanning 33 by 107 pixels.
; PLAN: r0=79(x), r1=35(y), r2=33(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 35
LDI r2, 33
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
