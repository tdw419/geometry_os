; DESCRIPTION: Creates a green rectangular region at (71, 149) spanning 118 by 21 pixels.
; PLAN: r0=71(x), r1=149(y), r2=118(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 149
LDI r2, 118
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
