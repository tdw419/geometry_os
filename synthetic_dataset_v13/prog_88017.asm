; DESCRIPTION: Creates a blue rectangular region at (66, 100) spanning 39 by 31 pixels.
; PLAN: r0=66(x), r1=100(y), r2=39(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 100
LDI r2, 39
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
