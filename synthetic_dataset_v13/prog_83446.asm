; DESCRIPTION: Creates a green rectangular region at (139, 151) spanning 86 by 49 pixels.
; PLAN: r0=139(x), r1=151(y), r2=86(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 151
LDI r2, 86
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
