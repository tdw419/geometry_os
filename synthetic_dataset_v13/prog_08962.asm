; DESCRIPTION: Creates a green rectangular region at (273, 3) spanning 65 by 38 pixels.
; PLAN: r0=273(x), r1=3(y), r2=65(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 3
LDI r2, 65
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
