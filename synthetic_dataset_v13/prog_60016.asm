; DESCRIPTION: Creates a green rectangular region at (73, 144) spanning 47 by 59 pixels.
; PLAN: r0=73(x), r1=144(y), r2=47(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 144
LDI r2, 47
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
