; DESCRIPTION: Creates a blue rectangular region at (16, 87) spanning 77 by 119 pixels.
; PLAN: r0=16(x), r1=87(y), r2=77(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 87
LDI r2, 77
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
