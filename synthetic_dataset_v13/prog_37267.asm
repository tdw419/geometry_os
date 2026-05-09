; DESCRIPTION: Creates a green rectangular region at (315, 13) spanning 74 by 73 pixels.
; PLAN: r0=315(x), r1=13(y), r2=74(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 13
LDI r2, 74
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
