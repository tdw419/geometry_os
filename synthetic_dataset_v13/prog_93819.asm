; DESCRIPTION: Creates a green rectangular region at (255, 189) spanning 39 by 29 pixels.
; PLAN: r0=255(x), r1=189(y), r2=39(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 189
LDI r2, 39
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
