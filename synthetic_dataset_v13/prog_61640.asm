; DESCRIPTION: Creates a green rectangular region at (114, 52) spanning 90 by 111 pixels.
; PLAN: r0=114(x), r1=52(y), r2=90(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 52
LDI r2, 90
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
