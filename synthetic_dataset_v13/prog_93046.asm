; DESCRIPTION: Creates a green rectangular region at (424, 132) spanning 70 by 12 pixels.
; PLAN: r0=424(x), r1=132(y), r2=70(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 132
LDI r2, 70
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
