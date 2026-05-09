; DESCRIPTION: Creates a purple rectangular region at (136, 1) spanning 64 by 93 pixels.
; PLAN: r0=136(x), r1=1(y), r2=64(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 1
LDI r2, 64
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
