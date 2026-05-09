; DESCRIPTION: Creates a green rectangular region at (63, 63) spanning 49 by 58 pixels.
; PLAN: r0=63(x), r1=63(y), r2=49(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 63
LDI r2, 49
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
