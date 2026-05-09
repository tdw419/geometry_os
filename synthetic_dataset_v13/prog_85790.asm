; DESCRIPTION: Creates a green rectangular region at (204, 216) spanning 53 by 20 pixels.
; PLAN: r0=204(x), r1=216(y), r2=53(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 216
LDI r2, 53
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
