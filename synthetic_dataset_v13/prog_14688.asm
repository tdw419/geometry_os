; DESCRIPTION: Creates a purple rectangular region at (5, 77) spanning 32 by 50 pixels.
; PLAN: r0=5(x), r1=77(y), r2=32(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 77
LDI r2, 32
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
