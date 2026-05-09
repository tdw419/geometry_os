; DESCRIPTION: Creates a yellow rectangular region at (301, 185) spanning 116 by 47 pixels.
; PLAN: r0=301(x), r1=185(y), r2=116(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 185
LDI r2, 116
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
