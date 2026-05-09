; DESCRIPTION: Creates a green rectangular region at (297, 116) spanning 29 by 17 pixels.
; PLAN: r0=297(x), r1=116(y), r2=29(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 116
LDI r2, 29
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
