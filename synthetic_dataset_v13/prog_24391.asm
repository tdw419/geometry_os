; DESCRIPTION: Creates a green rectangular region at (301, 3) spanning 36 by 114 pixels.
; PLAN: r0=301(x), r1=3(y), r2=36(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 3
LDI r2, 36
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
