; DESCRIPTION: Creates a green rectangular region at (140, 132) spanning 25 by 52 pixels.
; PLAN: r0=140(x), r1=132(y), r2=25(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 132
LDI r2, 25
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
