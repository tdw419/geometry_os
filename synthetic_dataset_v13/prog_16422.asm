; DESCRIPTION: Creates a purple rectangular region at (1, 10) spanning 10 by 77 pixels.
; PLAN: r0=1(x), r1=10(y), r2=10(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 10
LDI r2, 10
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
