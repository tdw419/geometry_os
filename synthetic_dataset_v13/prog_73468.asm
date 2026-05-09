; DESCRIPTION: Creates a green rectangular region at (91, 63) spanning 14 by 43 pixels.
; PLAN: r0=91(x), r1=63(y), r2=14(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 63
LDI r2, 14
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
