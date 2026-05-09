; DESCRIPTION: Creates a green rectangular region at (163, 126) spanning 95 by 81 pixels.
; PLAN: r0=163(x), r1=126(y), r2=95(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 126
LDI r2, 95
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
