; DESCRIPTION: Creates a purple rectangular region at (216, 103) spanning 64 by 101 pixels.
; PLAN: r0=216(x), r1=103(y), r2=64(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 103
LDI r2, 64
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
