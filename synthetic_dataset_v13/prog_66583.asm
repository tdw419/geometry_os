; DESCRIPTION: Creates a green rectangular region at (161, 50) spanning 14 by 78 pixels.
; PLAN: r0=161(x), r1=50(y), r2=14(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 50
LDI r2, 14
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
