; DESCRIPTION: Creates a purple rectangular region at (108, 71) spanning 98 by 116 pixels.
; PLAN: r0=108(x), r1=71(y), r2=98(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 71
LDI r2, 98
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
