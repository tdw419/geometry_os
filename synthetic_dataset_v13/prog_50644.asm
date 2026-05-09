; DESCRIPTION: Creates a green rectangular region at (69, 198) spanning 85 by 38 pixels.
; PLAN: r0=69(x), r1=198(y), r2=85(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 198
LDI r2, 85
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
