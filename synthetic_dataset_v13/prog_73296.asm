; DESCRIPTION: Creates a green rectangular region at (261, 21) spanning 89 by 20 pixels.
; PLAN: r0=261(x), r1=21(y), r2=89(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 21
LDI r2, 89
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
