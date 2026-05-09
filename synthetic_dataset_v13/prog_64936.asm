; DESCRIPTION: Creates a green rectangular region at (193, 80) spanning 101 by 37 pixels.
; PLAN: r0=193(x), r1=80(y), r2=101(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 80
LDI r2, 101
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
