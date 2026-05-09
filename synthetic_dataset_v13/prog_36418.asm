; DESCRIPTION: Creates a green rectangular region at (134, 189) spanning 72 by 40 pixels.
; PLAN: r0=134(x), r1=189(y), r2=72(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 189
LDI r2, 72
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
