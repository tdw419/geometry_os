; DESCRIPTION: Creates a blue rectangular region at (47, 23) spanning 26 by 77 pixels.
; PLAN: r0=47(x), r1=23(y), r2=26(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 23
LDI r2, 26
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
