; DESCRIPTION: Creates a green rectangular region at (344, 78) spanning 93 by 63 pixels.
; PLAN: r0=344(x), r1=78(y), r2=93(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 78
LDI r2, 93
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
