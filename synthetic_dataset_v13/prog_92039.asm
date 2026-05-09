; DESCRIPTION: Creates a green rectangular region at (307, 14) spanning 99 by 17 pixels.
; PLAN: r0=307(x), r1=14(y), r2=99(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 14
LDI r2, 99
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
