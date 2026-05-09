; DESCRIPTION: Creates a green rectangular region at (42, 23) spanning 102 by 110 pixels.
; PLAN: r0=42(x), r1=23(y), r2=102(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 23
LDI r2, 102
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
