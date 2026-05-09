; DESCRIPTION: Creates a blue rectangular region at (417, 91) spanning 44 by 36 pixels.
; PLAN: r0=417(x), r1=91(y), r2=44(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 91
LDI r2, 44
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
