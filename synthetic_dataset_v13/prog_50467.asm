; DESCRIPTION: Creates a purple rectangular region at (19, 145) spanning 48 by 95 pixels.
; PLAN: r0=19(x), r1=145(y), r2=48(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 145
LDI r2, 48
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
