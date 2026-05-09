; DESCRIPTION: Creates a green rectangular region at (370, 127) spanning 10 by 118 pixels.
; PLAN: r0=370(x), r1=127(y), r2=10(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 127
LDI r2, 10
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
