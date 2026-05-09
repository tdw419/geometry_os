; DESCRIPTION: Creates a green rectangular region at (88, 25) spanning 59 by 111 pixels.
; PLAN: r0=88(x), r1=25(y), r2=59(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 25
LDI r2, 59
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
