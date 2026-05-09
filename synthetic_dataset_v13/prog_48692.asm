; DESCRIPTION: Creates a green rectangular region at (22, 142) spanning 99 by 93 pixels.
; PLAN: r0=22(x), r1=142(y), r2=99(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 142
LDI r2, 99
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
