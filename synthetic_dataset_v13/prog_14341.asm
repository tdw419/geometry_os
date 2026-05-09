; DESCRIPTION: Creates a green rectangular region at (423, 148) spanning 20 by 103 pixels.
; PLAN: r0=423(x), r1=148(y), r2=20(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 148
LDI r2, 20
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
