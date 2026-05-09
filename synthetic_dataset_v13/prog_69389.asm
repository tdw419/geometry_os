; DESCRIPTION: Creates a blue rectangular region at (15, 99) spanning 16 by 24 pixels.
; PLAN: r0=15(x), r1=99(y), r2=16(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 99
LDI r2, 16
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
