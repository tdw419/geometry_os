; DESCRIPTION: Creates a yellow rectangular region at (126, 40) spanning 75 by 63 pixels.
; PLAN: r0=126(x), r1=40(y), r2=75(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 40
LDI r2, 75
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
