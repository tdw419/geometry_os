; DESCRIPTION: Creates a purple rectangular region at (490, 0) spanning 10 by 30 pixels.
; PLAN: r0=490(x), r1=0(y), r2=10(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 0
LDI r2, 10
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
