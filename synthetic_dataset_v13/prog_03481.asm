; DESCRIPTION: Creates a purple rectangular region at (317, 96) spanning 35 by 40 pixels.
; PLAN: r0=317(x), r1=96(y), r2=35(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 96
LDI r2, 35
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
