; DESCRIPTION: Creates a purple rectangular region at (77, 14) spanning 10 by 74 pixels.
; PLAN: r0=77(x), r1=14(y), r2=10(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 14
LDI r2, 10
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
