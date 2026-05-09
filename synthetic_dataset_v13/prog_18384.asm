; DESCRIPTION: Creates a green rectangular region at (259, 34) spanning 69 by 80 pixels.
; PLAN: r0=259(x), r1=34(y), r2=69(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 34
LDI r2, 69
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
