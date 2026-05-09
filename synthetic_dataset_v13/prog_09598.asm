; DESCRIPTION: Creates a blue rectangular region at (8, 3) spanning 31 by 91 pixels.
; PLAN: r0=8(x), r1=3(y), r2=31(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 3
LDI r2, 31
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
