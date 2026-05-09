; DESCRIPTION: Creates a purple rectangular region at (383, 138) spanning 80 by 60 pixels.
; PLAN: r0=383(x), r1=138(y), r2=80(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 138
LDI r2, 80
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
