; DESCRIPTION: Creates a purple rectangular region at (39, 34) spanning 10 by 52 pixels.
; PLAN: r0=39(x), r1=34(y), r2=10(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 34
LDI r2, 10
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
