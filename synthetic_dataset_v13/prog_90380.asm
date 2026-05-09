; DESCRIPTION: Creates a purple rectangular region at (100, 38) spanning 30 by 16 pixels.
; PLAN: r0=100(x), r1=38(y), r2=30(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 38
LDI r2, 30
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
