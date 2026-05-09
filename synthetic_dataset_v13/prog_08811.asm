; DESCRIPTION: Creates a purple rectangular region at (440, 7) spanning 56 by 118 pixels.
; PLAN: r0=440(x), r1=7(y), r2=56(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 7
LDI r2, 56
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
