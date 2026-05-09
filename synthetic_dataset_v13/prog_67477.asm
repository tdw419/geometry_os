; DESCRIPTION: Creates a purple rectangular region at (460, 69) spanning 35 by 79 pixels.
; PLAN: r0=460(x), r1=69(y), r2=35(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 69
LDI r2, 35
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
