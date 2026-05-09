; DESCRIPTION: Creates a green rectangular region at (247, 37) spanning 22 by 117 pixels.
; PLAN: r0=247(x), r1=37(y), r2=22(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 37
LDI r2, 22
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
