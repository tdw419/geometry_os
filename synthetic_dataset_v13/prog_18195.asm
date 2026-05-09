; DESCRIPTION: Creates a green rectangular region at (140, 58) spanning 117 by 91 pixels.
; PLAN: r0=140(x), r1=58(y), r2=117(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 58
LDI r2, 117
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
