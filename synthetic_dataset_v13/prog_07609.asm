; DESCRIPTION: Creates a purple rectangular region at (435, 75) spanning 77 by 94 pixels.
; PLAN: r0=435(x), r1=75(y), r2=77(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 75
LDI r2, 77
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
