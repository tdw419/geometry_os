; DESCRIPTION: Creates a green rectangular region at (136, 3) spanning 117 by 45 pixels.
; PLAN: r0=136(x), r1=3(y), r2=117(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 3
LDI r2, 117
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
