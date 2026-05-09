; DESCRIPTION: Creates a green rectangular region at (65, 32) spanning 78 by 18 pixels.
; PLAN: r0=65(x), r1=32(y), r2=78(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 32
LDI r2, 78
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
