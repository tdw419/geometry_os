; DESCRIPTION: Creates a yellow rectangular region at (323, 133) spanning 96 by 59 pixels.
; PLAN: r0=323(x), r1=133(y), r2=96(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 133
LDI r2, 96
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
