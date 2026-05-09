; DESCRIPTION: Creates a green rectangular region at (168, 119) spanning 94 by 22 pixels.
; PLAN: r0=168(x), r1=119(y), r2=94(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 119
LDI r2, 94
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
