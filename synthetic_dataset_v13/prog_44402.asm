; DESCRIPTION: Creates a green rectangular region at (448, 61) spanning 33 by 98 pixels.
; PLAN: r0=448(x), r1=61(y), r2=33(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 61
LDI r2, 33
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
