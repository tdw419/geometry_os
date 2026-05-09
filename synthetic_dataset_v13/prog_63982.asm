; DESCRIPTION: Creates a green rectangular region at (339, 149) spanning 86 by 37 pixels.
; PLAN: r0=339(x), r1=149(y), r2=86(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 149
LDI r2, 86
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
