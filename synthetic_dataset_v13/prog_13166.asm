; DESCRIPTION: Creates a green rectangular region at (73, 114) spanning 10 by 75 pixels.
; PLAN: r0=73(x), r1=114(y), r2=10(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 114
LDI r2, 10
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
