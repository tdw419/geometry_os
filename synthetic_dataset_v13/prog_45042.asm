; DESCRIPTION: Creates a blue rectangular region at (324, 25) spanning 31 by 11 pixels.
; PLAN: r0=324(x), r1=25(y), r2=31(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 25
LDI r2, 31
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
