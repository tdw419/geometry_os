; DESCRIPTION: Creates a blue rectangular region at (307, 97) spanning 23 by 80 pixels.
; PLAN: r0=307(x), r1=97(y), r2=23(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 97
LDI r2, 23
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
