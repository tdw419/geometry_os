; DESCRIPTION: Creates a green rectangular region at (22, 25) spanning 61 by 33 pixels.
; PLAN: r0=22(x), r1=25(y), r2=61(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 25
LDI r2, 61
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
