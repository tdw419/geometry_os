; DESCRIPTION: Creates a purple rectangular region at (133, 35) spanning 27 by 24 pixels.
; PLAN: r0=133(x), r1=35(y), r2=27(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 35
LDI r2, 27
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
