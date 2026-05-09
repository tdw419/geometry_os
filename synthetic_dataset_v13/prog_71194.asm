; DESCRIPTION: Creates a blue rectangular region at (414, 117) spanning 44 by 25 pixels.
; PLAN: r0=414(x), r1=117(y), r2=44(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 117
LDI r2, 44
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
