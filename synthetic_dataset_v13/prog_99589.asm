; DESCRIPTION: Creates a green rectangular region at (266, 115) spanning 93 by 58 pixels.
; PLAN: r0=266(x), r1=115(y), r2=93(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 115
LDI r2, 93
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
