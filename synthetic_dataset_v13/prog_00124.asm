; DESCRIPTION: Creates a white rectangular region at (147, 0) spanning 68 by 84 pixels.
; PLAN: r0=147(x), r1=0(y), r2=68(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 0
LDI r2, 68
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
