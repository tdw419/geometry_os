; DESCRIPTION: Creates a green rectangular region at (29, 162) spanning 59 by 58 pixels.
; PLAN: r0=29(x), r1=162(y), r2=59(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 162
LDI r2, 59
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
