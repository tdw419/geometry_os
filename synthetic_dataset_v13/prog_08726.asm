; DESCRIPTION: Creates a green rectangular region at (9, 232) spanning 59 by 12 pixels.
; PLAN: r0=9(x), r1=232(y), r2=59(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 232
LDI r2, 59
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
