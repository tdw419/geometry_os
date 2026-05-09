; DESCRIPTION: Creates a blue rectangular region at (457, 80) spanning 25 by 87 pixels.
; PLAN: r0=457(x), r1=80(y), r2=25(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 80
LDI r2, 25
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
