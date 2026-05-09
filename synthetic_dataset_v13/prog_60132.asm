; DESCRIPTION: Creates a green rectangular region at (240, 102) spanning 40 by 59 pixels.
; PLAN: r0=240(x), r1=102(y), r2=40(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 102
LDI r2, 40
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
