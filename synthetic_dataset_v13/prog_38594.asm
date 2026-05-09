; DESCRIPTION: Creates a green rectangular region at (303, 21) spanning 90 by 78 pixels.
; PLAN: r0=303(x), r1=21(y), r2=90(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 21
LDI r2, 90
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
