; DESCRIPTION: Creates a green rectangular region at (149, 178) spanning 45 by 40 pixels.
; PLAN: r0=149(x), r1=178(y), r2=45(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 178
LDI r2, 45
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
