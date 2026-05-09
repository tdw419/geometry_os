; DESCRIPTION: Creates a green rectangular region at (389, 22) spanning 70 by 39 pixels.
; PLAN: r0=389(x), r1=22(y), r2=70(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 22
LDI r2, 70
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
