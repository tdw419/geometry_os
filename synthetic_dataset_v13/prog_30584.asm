; DESCRIPTION: Creates a purple rectangular region at (278, 115) spanning 79 by 113 pixels.
; PLAN: r0=278(x), r1=115(y), r2=79(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 115
LDI r2, 79
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
