; DESCRIPTION: Creates a blue rectangular region at (345, 25) spanning 107 by 22 pixels.
; PLAN: r0=345(x), r1=25(y), r2=107(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 25
LDI r2, 107
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
