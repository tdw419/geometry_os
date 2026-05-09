; DESCRIPTION: Creates a blue rectangular region at (229, 26) spanning 58 by 99 pixels.
; PLAN: r0=229(x), r1=26(y), r2=58(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 26
LDI r2, 58
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
