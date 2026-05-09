; DESCRIPTION: Creates a green rectangular region at (131, 138) spanning 54 by 80 pixels.
; PLAN: r0=131(x), r1=138(y), r2=54(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 138
LDI r2, 54
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
