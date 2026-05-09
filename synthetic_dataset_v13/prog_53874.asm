; DESCRIPTION: Creates a blue rectangular region at (244, 169) spanning 116 by 24 pixels.
; PLAN: r0=244(x), r1=169(y), r2=116(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 169
LDI r2, 116
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
