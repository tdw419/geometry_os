; DESCRIPTION: Creates a green rectangular region at (223, 144) spanning 30 by 28 pixels.
; PLAN: r0=223(x), r1=144(y), r2=30(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 144
LDI r2, 30
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
