; DESCRIPTION: Creates a green rectangular region at (14, 58) spanning 93 by 44 pixels.
; PLAN: r0=14(x), r1=58(y), r2=93(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 58
LDI r2, 93
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
