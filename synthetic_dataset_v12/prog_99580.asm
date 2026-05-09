; DESCRIPTION: Creates a green rectangular region at (355, 59) spanning 81 by 96 pixels.
; PLAN: r0=355(x), r1=59(y), r2=81(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 59
LDI r2, 81
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
