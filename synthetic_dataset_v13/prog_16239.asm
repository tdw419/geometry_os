; DESCRIPTION: Creates a blue rectangular region at (301, 40) spanning 71 by 14 pixels.
; PLAN: r0=301(x), r1=40(y), r2=71(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 40
LDI r2, 71
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
