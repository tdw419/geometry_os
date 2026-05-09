; DESCRIPTION: Creates a blue rectangular region at (308, 169) spanning 48 by 15 pixels.
; PLAN: r0=308(x), r1=169(y), r2=48(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 169
LDI r2, 48
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
