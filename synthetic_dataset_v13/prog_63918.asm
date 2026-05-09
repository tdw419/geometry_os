; DESCRIPTION: Creates a green rectangular region at (65, 46) spanning 44 by 49 pixels.
; PLAN: r0=65(x), r1=46(y), r2=44(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 46
LDI r2, 44
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
