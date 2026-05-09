; DESCRIPTION: Creates a white rectangular region at (147, 76) spanning 68 by 86 pixels.
; PLAN: r0=147(x), r1=76(y), r2=68(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 76
LDI r2, 68
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
