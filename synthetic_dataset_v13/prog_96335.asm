; DESCRIPTION: Creates a green rectangular region at (267, 16) spanning 110 by 60 pixels.
; PLAN: r0=267(x), r1=16(y), r2=110(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 16
LDI r2, 110
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
