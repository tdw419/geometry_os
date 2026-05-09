; DESCRIPTION: Creates a green rectangular region at (277, 110) spanning 81 by 86 pixels.
; PLAN: r0=277(x), r1=110(y), r2=81(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 110
LDI r2, 81
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
