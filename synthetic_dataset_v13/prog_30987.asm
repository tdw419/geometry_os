; DESCRIPTION: Creates a purple rectangular region at (96, 117) spanning 93 by 20 pixels.
; PLAN: r0=96(x), r1=117(y), r2=93(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 117
LDI r2, 93
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
