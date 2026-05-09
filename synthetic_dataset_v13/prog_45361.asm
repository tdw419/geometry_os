; DESCRIPTION: Creates a purple rectangular region at (142, 144) spanning 115 by 74 pixels.
; PLAN: r0=142(x), r1=144(y), r2=115(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 144
LDI r2, 115
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
