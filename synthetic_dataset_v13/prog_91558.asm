; DESCRIPTION: Creates a green rectangular region at (230, 83) spanning 98 by 97 pixels.
; PLAN: r0=230(x), r1=83(y), r2=98(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 83
LDI r2, 98
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
