; DESCRIPTION: Creates a green rectangular region at (255, 47) spanning 99 by 119 pixels.
; PLAN: r0=255(x), r1=47(y), r2=99(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 47
LDI r2, 99
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
