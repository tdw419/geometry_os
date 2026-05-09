; DESCRIPTION: Creates a green rectangular region at (437, 132) spanning 47 by 80 pixels.
; PLAN: r0=437(x), r1=132(y), r2=47(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 132
LDI r2, 47
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
