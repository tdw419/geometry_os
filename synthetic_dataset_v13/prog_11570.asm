; DESCRIPTION: Creates a green rectangular region at (141, 68) spanning 43 by 56 pixels.
; PLAN: r0=141(x), r1=68(y), r2=43(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 68
LDI r2, 43
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
