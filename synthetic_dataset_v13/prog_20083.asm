; DESCRIPTION: Creates a green rectangular region at (94, 40) spanning 44 by 60 pixels.
; PLAN: r0=94(x), r1=40(y), r2=44(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 40
LDI r2, 44
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
