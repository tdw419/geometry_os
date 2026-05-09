; DESCRIPTION: Creates a green rectangular region at (313, 99) spanning 86 by 94 pixels.
; PLAN: r0=313(x), r1=99(y), r2=86(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 99
LDI r2, 86
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
