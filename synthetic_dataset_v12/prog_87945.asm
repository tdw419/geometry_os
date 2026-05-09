; DESCRIPTION: Creates a green rectangular region at (218, 141) spanning 29 by 88 pixels.
; PLAN: r0=218(x), r1=141(y), r2=29(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 141
LDI r2, 29
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
