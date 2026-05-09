; DESCRIPTION: Creates a green rectangular region at (66, 82) spanning 63 by 78 pixels.
; PLAN: r0=66(x), r1=82(y), r2=63(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 82
LDI r2, 63
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
