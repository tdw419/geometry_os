; DESCRIPTION: Creates a green rectangular region at (318, 50) spanning 71 by 73 pixels.
; PLAN: r0=318(x), r1=50(y), r2=71(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 50
LDI r2, 71
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
