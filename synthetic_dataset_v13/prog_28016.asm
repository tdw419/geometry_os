; DESCRIPTION: Creates a green rectangular region at (347, 117) spanning 115 by 113 pixels.
; PLAN: r0=347(x), r1=117(y), r2=115(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 117
LDI r2, 115
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
