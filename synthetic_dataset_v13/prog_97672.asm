; DESCRIPTION: Creates a green rectangular region at (337, 188) spanning 54 by 58 pixels.
; PLAN: r0=337(x), r1=188(y), r2=54(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 188
LDI r2, 54
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
