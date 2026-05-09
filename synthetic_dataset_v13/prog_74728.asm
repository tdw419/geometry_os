; DESCRIPTION: Creates a green rectangular region at (329, 123) spanning 75 by 113 pixels.
; PLAN: r0=329(x), r1=123(y), r2=75(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 123
LDI r2, 75
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
