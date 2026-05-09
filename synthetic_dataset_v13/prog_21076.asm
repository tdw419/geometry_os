; DESCRIPTION: Creates a green rectangular region at (25, 192) spanning 18 by 11 pixels.
; PLAN: r0=25(x), r1=192(y), r2=18(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 192
LDI r2, 18
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
