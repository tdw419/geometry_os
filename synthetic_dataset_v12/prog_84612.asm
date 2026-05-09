; DESCRIPTION: Creates a green rectangular region at (320, 47) spanning 118 by 98 pixels.
; PLAN: r0=320(x), r1=47(y), r2=118(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 47
LDI r2, 118
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
