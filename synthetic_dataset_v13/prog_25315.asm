; DESCRIPTION: Creates a purple rectangular region at (440, 100) spanning 48 by 119 pixels.
; PLAN: r0=440(x), r1=100(y), r2=48(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 100
LDI r2, 48
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
