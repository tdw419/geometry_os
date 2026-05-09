; DESCRIPTION: Creates a green rectangular region at (80, 189) spanning 15 by 37 pixels.
; PLAN: r0=80(x), r1=189(y), r2=15(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 189
LDI r2, 15
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
