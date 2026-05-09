; DESCRIPTION: Creates a green rectangular region at (251, 47) spanning 108 by 26 pixels.
; PLAN: r0=251(x), r1=47(y), r2=108(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 47
LDI r2, 108
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
