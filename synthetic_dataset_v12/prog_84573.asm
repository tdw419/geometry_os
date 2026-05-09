; DESCRIPTION: Creates a purple rectangular region at (138, 62) spanning 120 by 106 pixels.
; PLAN: r0=138(x), r1=62(y), r2=120(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 62
LDI r2, 120
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
