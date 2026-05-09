; DESCRIPTION: Creates a green rectangular region at (261, 123) spanning 85 by 53 pixels.
; PLAN: r0=261(x), r1=123(y), r2=85(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 123
LDI r2, 85
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
