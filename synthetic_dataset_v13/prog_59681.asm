; DESCRIPTION: Creates a purple rectangular region at (99, 52) spanning 113 by 74 pixels.
; PLAN: r0=99(x), r1=52(y), r2=113(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 52
LDI r2, 113
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
