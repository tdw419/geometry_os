; DESCRIPTION: Creates a green rectangular region at (54, 99) spanning 61 by 11 pixels.
; PLAN: r0=54(x), r1=99(y), r2=61(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 99
LDI r2, 61
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
