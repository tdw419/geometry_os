; DESCRIPTION: Creates a green rectangular region at (383, 94) spanning 30 by 35 pixels.
; PLAN: r0=383(x), r1=94(y), r2=30(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 94
LDI r2, 30
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
