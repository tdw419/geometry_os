; DESCRIPTION: Creates a green rectangular region at (228, 56) spanning 84 by 115 pixels.
; PLAN: r0=228(x), r1=56(y), r2=84(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 56
LDI r2, 84
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
