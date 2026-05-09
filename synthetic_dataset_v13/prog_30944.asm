; DESCRIPTION: Creates a green rectangular region at (336, 32) spanning 116 by 65 pixels.
; PLAN: r0=336(x), r1=32(y), r2=116(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 32
LDI r2, 116
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
