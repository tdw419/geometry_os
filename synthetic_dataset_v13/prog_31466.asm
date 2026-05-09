; DESCRIPTION: Creates a green rectangular region at (23, 46) spanning 15 by 68 pixels.
; PLAN: r0=23(x), r1=46(y), r2=15(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 46
LDI r2, 15
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
