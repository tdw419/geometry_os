; DESCRIPTION: Creates a green rectangular region at (416, 29) spanning 73 by 63 pixels.
; PLAN: r0=416(x), r1=29(y), r2=73(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 29
LDI r2, 73
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
