; DESCRIPTION: Creates a green rectangular region at (120, 30) spanning 33 by 114 pixels.
; PLAN: r0=120(x), r1=30(y), r2=33(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 30
LDI r2, 33
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
