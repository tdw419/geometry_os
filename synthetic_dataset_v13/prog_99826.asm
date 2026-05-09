; DESCRIPTION: Creates a green rectangular region at (437, 1) spanning 71 by 35 pixels.
; PLAN: r0=437(x), r1=1(y), r2=71(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 1
LDI r2, 71
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
