; DESCRIPTION: Creates a green rectangular region at (105, 94) spanning 92 by 103 pixels.
; PLAN: r0=105(x), r1=94(y), r2=92(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 94
LDI r2, 92
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
