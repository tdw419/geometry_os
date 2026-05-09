; DESCRIPTION: Creates a yellow rectangular region at (256, 59) spanning 96 by 62 pixels.
; PLAN: r0=256(x), r1=59(y), r2=96(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 59
LDI r2, 96
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
