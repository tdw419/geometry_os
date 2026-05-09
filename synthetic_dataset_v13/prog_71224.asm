; DESCRIPTION: Creates a green rectangular region at (76, 207) spanning 38 by 19 pixels.
; PLAN: r0=76(x), r1=207(y), r2=38(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 207
LDI r2, 38
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
