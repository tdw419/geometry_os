; DESCRIPTION: Creates a white rectangular region at (94, 136) spanning 58 by 96 pixels.
; PLAN: r0=94(x), r1=136(y), r2=58(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 136
LDI r2, 58
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
