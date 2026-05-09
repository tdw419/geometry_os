; DESCRIPTION: Creates a purple rectangular region at (75, 10) spanning 74 by 29 pixels.
; PLAN: r0=75(x), r1=10(y), r2=74(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 10
LDI r2, 74
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
