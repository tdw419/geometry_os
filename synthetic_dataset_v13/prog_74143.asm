; DESCRIPTION: Creates a green rectangular region at (18, 94) spanning 46 by 14 pixels.
; PLAN: r0=18(x), r1=94(y), r2=46(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 94
LDI r2, 46
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
