; DESCRIPTION: Creates a green rectangular region at (301, 84) spanning 86 by 117 pixels.
; PLAN: r0=301(x), r1=84(y), r2=86(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 84
LDI r2, 86
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
