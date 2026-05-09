; DESCRIPTION: Creates a green rectangular region at (10, 115) spanning 13 by 63 pixels.
; PLAN: r0=10(x), r1=115(y), r2=13(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 115
LDI r2, 13
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
