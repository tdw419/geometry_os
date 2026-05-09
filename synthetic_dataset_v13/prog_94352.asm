; DESCRIPTION: Creates a green rectangular region at (156, 80) spanning 43 by 36 pixels.
; PLAN: r0=156(x), r1=80(y), r2=43(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 80
LDI r2, 43
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
