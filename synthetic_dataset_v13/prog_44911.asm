; DESCRIPTION: Creates a green rectangular region at (9, 25) spanning 12 by 23 pixels.
; PLAN: r0=9(x), r1=25(y), r2=12(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 25
LDI r2, 12
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
