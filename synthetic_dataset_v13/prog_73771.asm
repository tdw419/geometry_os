; DESCRIPTION: Creates a green rectangular region at (418, 87) spanning 75 by 87 pixels.
; PLAN: r0=418(x), r1=87(y), r2=75(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 87
LDI r2, 75
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
