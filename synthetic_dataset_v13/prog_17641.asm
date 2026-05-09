; DESCRIPTION: Creates a green rectangular region at (290, 159) spanning 58 by 63 pixels.
; PLAN: r0=290(x), r1=159(y), r2=58(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 159
LDI r2, 58
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
