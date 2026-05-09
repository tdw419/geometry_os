; DESCRIPTION: Creates a green rectangular region at (116, 208) spanning 106 by 48 pixels.
; PLAN: r0=116(x), r1=208(y), r2=106(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 208
LDI r2, 106
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
