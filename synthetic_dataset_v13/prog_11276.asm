; DESCRIPTION: Creates a green rectangular region at (270, 20) spanning 87 by 92 pixels.
; PLAN: r0=270(x), r1=20(y), r2=87(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 20
LDI r2, 87
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
