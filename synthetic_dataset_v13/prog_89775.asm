; DESCRIPTION: Creates a green rectangular region at (423, 85) spanning 65 by 102 pixels.
; PLAN: r0=423(x), r1=85(y), r2=65(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 85
LDI r2, 65
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
