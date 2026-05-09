; DESCRIPTION: Creates a green rectangular region at (273, 23) spanning 85 by 98 pixels.
; PLAN: r0=273(x), r1=23(y), r2=85(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 23
LDI r2, 85
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
