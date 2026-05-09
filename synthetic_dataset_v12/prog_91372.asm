; DESCRIPTION: Creates a green rectangular region at (423, 94) spanning 85 by 111 pixels.
; PLAN: r0=423(x), r1=94(y), r2=85(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 94
LDI r2, 85
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
