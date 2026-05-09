; DESCRIPTION: Creates a green rectangular region at (163, 176) spanning 117 by 60 pixels.
; PLAN: r0=163(x), r1=176(y), r2=117(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 176
LDI r2, 117
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
