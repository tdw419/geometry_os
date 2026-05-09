; DESCRIPTION: Creates a purple rectangular region at (236, 136) spanning 39 by 49 pixels.
; PLAN: r0=236(x), r1=136(y), r2=39(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 136
LDI r2, 39
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
