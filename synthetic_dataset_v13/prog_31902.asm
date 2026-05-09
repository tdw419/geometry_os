; DESCRIPTION: Creates a green rectangular region at (47, 116) spanning 91 by 94 pixels.
; PLAN: r0=47(x), r1=116(y), r2=91(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 116
LDI r2, 91
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
