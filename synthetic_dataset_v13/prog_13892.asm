; DESCRIPTION: Creates a blue rectangular region at (351, 143) spanning 59 by 92 pixels.
; PLAN: r0=351(x), r1=143(y), r2=59(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 143
LDI r2, 59
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
