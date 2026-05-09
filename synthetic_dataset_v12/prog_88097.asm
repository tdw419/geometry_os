; DESCRIPTION: Creates a green rectangular region at (360, 151) spanning 112 by 23 pixels.
; PLAN: r0=360(x), r1=151(y), r2=112(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 151
LDI r2, 112
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
