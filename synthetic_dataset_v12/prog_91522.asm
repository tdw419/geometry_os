; DESCRIPTION: Creates a yellow rectangular region at (307, 201) spanning 114 by 35 pixels.
; PLAN: r0=307(x), r1=201(y), r2=114(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 201
LDI r2, 114
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
