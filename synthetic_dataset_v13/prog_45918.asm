; DESCRIPTION: Creates a green rectangular region at (149, 134) spanning 20 by 44 pixels.
; PLAN: r0=149(x), r1=134(y), r2=20(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 134
LDI r2, 20
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
