; DESCRIPTION: Creates a green rectangular region at (317, 54) spanning 96 by 14 pixels.
; PLAN: r0=317(x), r1=54(y), r2=96(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 54
LDI r2, 96
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
