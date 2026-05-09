; DESCRIPTION: Creates a green rectangular region at (162, 60) spanning 14 by 71 pixels.
; PLAN: r0=162(x), r1=60(y), r2=14(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 60
LDI r2, 14
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
