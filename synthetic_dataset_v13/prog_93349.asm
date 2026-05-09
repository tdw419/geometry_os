; DESCRIPTION: Creates a purple rectangular region at (381, 172) spanning 74 by 48 pixels.
; PLAN: r0=381(x), r1=172(y), r2=74(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 172
LDI r2, 74
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
