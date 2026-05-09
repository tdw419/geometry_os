; DESCRIPTION: Creates a green rectangular region at (208, 8) spanning 116 by 72 pixels.
; PLAN: r0=208(x), r1=8(y), r2=116(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 8
LDI r2, 116
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
