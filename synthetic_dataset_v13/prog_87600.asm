; DESCRIPTION: Creates a green rectangular region at (347, 42) spanning 110 by 115 pixels.
; PLAN: r0=347(x), r1=42(y), r2=110(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 42
LDI r2, 110
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
