; DESCRIPTION: Creates a green rectangular region at (205, 71) spanning 116 by 62 pixels.
; PLAN: r0=205(x), r1=71(y), r2=116(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 71
LDI r2, 116
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
