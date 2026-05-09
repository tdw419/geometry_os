; DESCRIPTION: Creates a purple rectangular region at (25, 12) spanning 52 by 75 pixels.
; PLAN: r0=25(x), r1=12(y), r2=52(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 12
LDI r2, 52
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
