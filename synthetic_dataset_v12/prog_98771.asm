; DESCRIPTION: Creates a purple rectangular region at (300, 81) spanning 24 by 100 pixels.
; PLAN: r0=300(x), r1=81(y), r2=24(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 81
LDI r2, 24
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
