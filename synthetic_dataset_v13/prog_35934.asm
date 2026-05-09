; DESCRIPTION: Creates a purple rectangular region at (138, 98) spanning 109 by 108 pixels.
; PLAN: r0=138(x), r1=98(y), r2=109(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 98
LDI r2, 109
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
